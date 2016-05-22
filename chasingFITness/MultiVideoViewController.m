//
//  MultiVideoViewViewController.m
//  chasingFITness
//
//  Created by Trung Do on 2/23/16.
//  Copyright © 2016 ;. All rights reserved.
//

#import "MultiVideoViewController.h"
#import "AppDelegate.h"
#import "CustomWorkoutSetClass.h"
@interface MultiVideoViewController ()
@end

@implementation MultiVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hiddenList = [[NSMutableArray alloc]init ];
//    self.playerViewList = [[NSMutableArray alloc]init ];
//
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    self.navigationController.navigationBar.topItem.title = @"";
    _videoContentsView.delegate = self;

    [self setUpLabel];
    
    [self createAllViewScrollView];
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    [aScrollView setContentOffset: CGPointMake(aScrollView.contentOffset.x,0)];
    
}
-(void) setUpLabel{
    //NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedRoutines"];
    if (dataRepresentingSavedArray !=nil){
        NSLog(@"there is something in data");
       
            NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
            NSLog(@"Size:%lu", [oldSavedArray count]);
                for (int i =0; i <[oldSavedArray count]; i++){
                        [[oldSavedArray objectAtIndex:i] printDetails];
                    }
        
    }
    else
        NSLog (@"there is NOTHING in data");
    //self.clockTimer.hidden = true;
    if (self.setTime <= 60)
        self.breakTime = 30;
    else self.breakTime = 45;
    
    if (self.setTime <= 60)
        self.transitionTime = 75;
    else self.transitionTime = 120;
    
    self.saveThisPracticeButton.hidden = true;
    
    self.currentExerciseIndex = 0;
    self.timerLabel.numberOfLines=0;
    [self.timerLabel setLineBreakMode:NSLineBreakByWordWrapping];

}
- (IBAction)tapStartTimer:(id)sender {
    [self initializeTimer];
    self.startButton.hidden = true;
  //  self.swipeInstructionView.hidden = true;
}
- (void) initializeTimer{
    
    
    self.timer = self.setTime;
    self.tempNumOfSet = 1;
    self.clockTimer.hidden = false;
    self.timerLabel.text = [NSString stringWithFormat:@"Set %d / %d",self.tempNumOfSet,self.numberOfSet];
    self.clockTimer.text = [NSString stringWithFormat:@"%d",self.timer];
    self.progressLabel.text = [NSString stringWithFormat:@"#%d: %@",self.currentExerciseIndex +1,[self.multiplePracticesArray objectAtIndex:self.currentExerciseIndex]];
    self.timerObject = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setTimer) userInfo:nil repeats:YES];
}
- (void) setTimer{
    self.timer --;
    
    self.timerLabel.text = [NSString stringWithFormat:@"Set %d / %d",self.tempNumOfSet,self.numberOfSet];
    self.clockTimer.text = [NSString stringWithFormat:@"%d",self.timer];
    if (self.tempNumOfSet < self.numberOfSet && self.timer <= 0){
            [self.timerObject invalidate];
            self.timer = self.breakTime;
        
            self.timerObject = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(breakTimer) userInfo:nil repeats:YES];
    }
    else{
        if (self.tempNumOfSet == self.numberOfSet && self.timer <= 0 ){
            [self.timerObject invalidate];

            self.timer = self.transitionTime;
            self.currentExerciseIndex ++;
            if (self.currentExerciseIndex < [self.multiplePracticesArray count]){
                self.timerLabel.text = [NSString stringWithFormat:@"Start in"];
                self.progressLabel.text = [NSString stringWithFormat:@"NEXT EXERCISE: %@",[self.multiplePracticesArray objectAtIndex:self.currentExerciseIndex ]];
               // UILabel * temp = [self.hiddenList objectAtIndex:self.currentExerciseIndex-1];
                //temp.hidden = false;
                
                self.timerObject = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(transitionTimer) userInfo:nil repeats:YES];
                
            }
            else
            {
                self.startButton.hidden = false;
                [self.startButton setTitle: [NSString stringWithFormat:@"Restart work-out session"] forState:UIControlStateNormal];
                for (UIImageView* img in self.hiddenList){
                    img.layer.hidden = YES;
                }
                self.currentExerciseIndex = 0;
                [self popUpGreatJob];
                self.saveThisPracticeButton.hidden = false;
            }
            return;
        }
    }
    
}
- (void) breakTimer{
    self.timer --;
    self.timerLabel.text = [NSString stringWithFormat:@"BREAK \n [%d set(s) left]",(self.numberOfSet - self.tempNumOfSet)];
    self.clockTimer.text = [NSString stringWithFormat:@"%d",self.timer];
    
    if (self.timer == 0){
        self.tempNumOfSet++;
        [self.timerObject invalidate];
        self.timer = self.setTime;
        self.timerObject = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setTimer) userInfo:nil repeats:YES];
        
    }
}
-(void) transitionTimer{
    self.timer --;
    self.clockTimer.text = [NSString stringWithFormat:@"%d",self.timer];
    UIImageView *a = [self.hiddenList objectAtIndex:self.currentExerciseIndex-1];
    a.layer.hidden = NO;
    if (self.timer == 0){
        [self.timerObject invalidate];
        self.startButton.hidden = false;
        
        if (self.currentExerciseIndex < [self.multiplePracticesArray count]){
            [self.startButton setTitle: [NSString stringWithFormat:@"START: %@", [self.multiplePracticesArray objectAtIndex:self.currentExerciseIndex]] forState:UIControlStateNormal];
             // self.swipeInstructionView.hidden = false;
            
        }
        return;
    }
}
- (IBAction)saveExerciseTap:(id)sender {
    //NSString *str = @"haha";
    if ([self.saveThisPracticeButton.titleLabel.text isEqualToString:@"SAVE THIS ROUTINE"]){
        [self popUpAskingNameToSave];
    }
    else{
        [self.navigationController popToRootViewControllerAnimated:true];
    }
}
- (void) popUpAskingNameToSave{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Save this routine"
                                  message:@"Choose a name for this exercise:"
                                  preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // optionally configure the text field
        textField.keyboardType = UIKeyboardTypeAlphabet;
    }];
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Save"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    //Handel your yes please button action here
                                    [self saveData:[alert.textFields firstObject].text];
                                    
                                }];
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Handel no, thanks button
                                   
                               }];
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];

}
- (void) popUpGreatJob{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"GREAT JOB!"
                                  message:@"You finished the workout."
                                  preferredStyle:UIAlertControllerStyleAlert];
  
    
    UIAlertAction* doneButton = [UIAlertAction
                               actionWithTitle:@"Done"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Handel no, thanks button
                                   
                               }];
    
    [alert addAction:doneButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)saveData:(NSString*) name
{
    NSLog(@"Name: %@", name);
    CustomWorkoutSetClass * a = [[CustomWorkoutSetClass alloc]init];
    [a setName:name];
    [a setAllPracticesArray:self.multiplePracticesArray];
    [a setSetTime: self.setTime];
    [a setNumSet:self.numberOfSet];
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedRoutines"];
    if (dataRepresentingSavedArray == nil){
        NSLog(@"NULLLLL");
        NSArray *emptyArray = [[NSArray alloc] init];
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:emptyArray] forKey:@"savedRoutines"];

    }
    NSMutableArray *addedArray;
    dataRepresentingSavedArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedRoutines"];
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        NSLog(@"Size:%lu", [oldSavedArray count]);
//        for (int i =0; i <[oldSavedArray count]; i++){
//            [[oldSavedArray objectAtIndex:i] printDetails];
//        }
        addedArray= [oldSavedArray mutableCopy];
        [addedArray addObject:a];
        NSLog(@"New Size:%lu", [addedArray count]);

        
    }
    
    NSLog(@"New Size:%lu", [addedArray count]);
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:addedArray] forKey:@"savedRoutines"];
    [[NSUserDefaults standardUserDefaults] synchronize];
   // NSArray *temp = [addedArray copy];
    // this will save you UserDefaults
    
    NSData *data = [currentDefaults objectForKey:@"savedRoutines"];
    if (data != nil)
    {
        NSArray *kkk = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        NSLog(@"New Size:%lu", [kkk count]);
        //        for (int i =0; i <[oldSavedArray count]; i++){
        //            [[oldSavedArray objectAtIndex:i] printDetails];
        //        }
    }
[self.saveThisPracticeButton setTitle: [NSString stringWithFormat:@"HOME"] forState:UIControlStateNormal];

   // self.saveThisPracticeButton.hidden = true;

}- (void)loadView:(NSString*) exerciseName withIndex:(int) index{
    AVPlayer *player;
    AVPlayerClass *playerView;
//    [self.playerViewList addObject:playerView];
    
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:exerciseName withExtension:@"mov"];
    player =[AVPlayer playerWithURL:videoURL];
    [playerView setMovieToPlayer:player];
    //[player setVolume:0.0];
    [player setMuted:true];
    AVPlayerLayer *layer = [AVPlayerLayer layer];
    float b =self.view.frame.size.width;
    
    player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[player currentItem]];
    [layer setPlayer:player];
    [layer setFrame:CGRectMake((index * b),0,b, self.view.frame.size.height/3)];
    [layer setBackgroundColor:[UIColor redColor].CGColor];
//    [layer setOpacity:0.75];
    [layer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    [self.videoContentsView.layer addSublayer: layer];

    
    [player play];
    UIImage *stopImage = [UIImage imageNamed:@"swipeleft.png"];
    UIImageView *attachmentImageNew = [[UIImageView alloc] initWithFrame:CGRectMake((index * b),0,b, self.view.frame.size.height/3)];
    attachmentImageNew.image = stopImage;
    attachmentImageNew.backgroundColor = [UIColor blackColor];
    //attachmentImageNew.contentMode = UIViewContentModeScaleAspectFit;
    [self.videoContentsView.layer addSublayer: attachmentImageNew.layer];
    attachmentImageNew.layer.hidden = YES;
    
    [self.hiddenList addObject:attachmentImageNew];

    
    
    
    //Exercise Name Label
    UILabel  * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((index * b),self.view.frame.size.height/3,b, 50)];
    nameLabel.numberOfLines=0;
   // nameLabel.lineBreakMode=UILineBreakModeCharacterWrap;
    [nameLabel setLineBreakMode:NSLineBreakByWordWrapping];

    nameLabel.text = exerciseName;
    nameLabel.backgroundColor = [UIColor blackColor];
    nameLabel.textColor = [UIColor redColor];
    [self.videoContentsView addSubview: nameLabel];

    UILabel  * instructionLabel = [[UILabel alloc] initWithFrame:CGRectMake((index * b),self.view.frame.size.height/3+50,b, 100)];
    instructionLabel.numberOfLines=0;
   // instructionLabel.lineBreakMode=UILineBreakModeCharacterWrap;
    [instructionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    instructionLabel.backgroundColor = [UIColor blackColor];
    instructionLabel.textColor = [UIColor whiteColor];
    readData * dataReader = [[readData alloc] init];
    instructionLabel.text =[dataReader fetchedInstruction:exerciseName];
    [self.videoContentsView addSubview: instructionLabel];
    
    UILabel  * finished = [[UILabel alloc] initWithFrame:CGRectMake((index * b),0,b, self.view.frame.size.height/3)];
    finished.numberOfLines=0;
    // instructionLabel.lineBreakMode=UILineBreakModeCharacterWrap;
    [finished setLineBreakMode:NSLineBreakByWordWrapping];
    finished.backgroundColor = [UIColor blackColor];
    finished.tintColor = [UIColor whiteColor];
    finished.textColor = [UIColor whiteColor];
    finished.text = [NSString stringWithFormat:@"Finished, swipe left for the next exercises"];
    //[self.hiddenList addObject: finished];

    [self.videoContentsView addSubview: finished];
    
    finished.hidden = true;
    
}
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}
-(void) createAllViewScrollView{
    float b =self.view.frame.size.width;
    self.videoContentsView.contentSize = CGSizeMake([self.multiplePracticesArray count] * b,500);
 
    for (int i=0; i<[self.multiplePracticesArray count]; i++){
        [self loadView:[self.multiplePracticesArray objectAtIndex:i] withIndex:i];
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
