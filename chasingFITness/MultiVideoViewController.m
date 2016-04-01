//
//  MultiVideoViewViewController.m
//  chasingFITness
//
//  Created by Trung Do on 2/23/16.
//  Copyright © 2016 ;. All rights reserved.
//

#import "MultiVideoViewController.h"

@interface MultiVideoViewController ()
@end

@implementation MultiVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.playerList = [[NSMutableArray alloc]init ];
//    self.playerViewList = [[NSMutableArray alloc]init ];
//
    [self setUpLabel];
    
    [self createAllViewScrollView];
}
-(void) setUpLabel{
    //self.clockTimer.hidden = true;
    if (self.setTime <= 60)
        self.breakTime = 30;
    else self.breakTime = 45;
    
    if (self.setTime <= 60)
        self.transitionTime = 75;
    else self.transitionTime = 120;
    
    self.setTime=2;
    self.breakTime = 2;
    self.transitionTime = 2;
    
    
    self.currentExerciseIndex = 0;
    self.timerLabel.numberOfLines=0;
    self.timerLabel.lineBreakMode = UILineBreakModeCharacterWrap;
}
- (IBAction)tapStartTimer:(id)sender {
    [self initializeTimer];
    self.startButton.hidden = true;
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
    if (self.tempNumOfSet <= self.numberOfSet && self.timer == 0){
            [self.timerObject invalidate];
            self.timer = self.breakTime;
        
            self.timerObject = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(breakTimer) userInfo:nil repeats:YES];
    }
    
}
- (void) breakTimer{
    self.timer --;
    self.timerLabel.text = [NSString stringWithFormat:@"BREAK \n [%d set(s) left]",(self.numberOfSet - self.tempNumOfSet)];
    self.clockTimer.text = [NSString stringWithFormat:@"%d",self.timer];
    
    if (self.timer == 0){
        self.tempNumOfSet++;
        [self.timerObject invalidate];
        if (self.tempNumOfSet > self.numberOfSet){
            self.timer = self.transitionTime;
            self.currentExerciseIndex ++;
            if (self.currentExerciseIndex < [self.multiplePracticesArray count]){
                self.timerLabel.text = [NSString stringWithFormat:@"Next exercise will start in"];
                self.progressLabel.text = [NSString stringWithFormat:@"NEXT EXERCISE: %@",[self.multiplePracticesArray objectAtIndex:self.currentExerciseIndex ]];
                self.timerObject = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(transitionTimer) userInfo:nil repeats:YES];
            }
            else
            {
                self.startButton.hidden = false;
                [self.startButton setTitle: [NSString stringWithFormat:@"Restart work-out session"] forState:UIControlStateNormal];
                self.currentExerciseIndex = 0;
                
            }
            return;
        }
        else{
        self.timer = self.setTime;
        self.timerObject = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setTimer) userInfo:nil repeats:YES];
        }
    }
}
-(void) transitionTimer{
    self.timer --;
    self.clockTimer.text = [NSString stringWithFormat:@"%d",self.timer];

    if (self.timer == 0){
        [self.timerObject invalidate];
        self.startButton.hidden = false;
        if (self.currentExerciseIndex < [self.multiplePracticesArray count]){
            [self.startButton setTitle: [NSString stringWithFormat:@"START next exercise: %@", [self.multiplePracticesArray objectAtIndex:self.currentExerciseIndex]] forState:UIControlStateNormal];
        }
        return;
    }
}
- (void)loadView:(NSString*) exerciseName withIndex:(int) index{
    AVPlayer *player;
    AVPlayerClass *playerView;
//    [self.playerList addObject:player];
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
    [layer setOpacity:0.75];
    [layer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    [self.videoContentsView.layer addSublayer: layer];
    
    [player play];
    
    
    //Exercise Name Label
    UILabel  * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((index * b),self.view.frame.size.height/3,b, 50)];
    nameLabel.numberOfLines=0;
    nameLabel.lineBreakMode=UILineBreakModeCharacterWrap;
    nameLabel.text = exerciseName;
    nameLabel.backgroundColor = [UIColor blackColor];
    nameLabel.textColor = [UIColor redColor];
    [self.videoContentsView addSubview: nameLabel];

    UILabel  * instructionLabel = [[UILabel alloc] initWithFrame:CGRectMake((index * b),self.view.frame.size.height/3+50,b, 100)];
    instructionLabel.numberOfLines=0;
    instructionLabel.lineBreakMode=UILineBreakModeCharacterWrap;
    instructionLabel.backgroundColor = [UIColor blackColor];
    instructionLabel.textColor = [UIColor whiteColor];
    readData * dataReader = [[readData alloc] init];
    instructionLabel.text =[dataReader fetchedInstruction:exerciseName];
    [self.videoContentsView addSubview: instructionLabel];

    
    
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
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        VideoView *videoVC = (VideoView *) [storyboard instantiateViewControllerWithIdentifier:@"VideoView"];
//        videoVC.nameOfVideo = [NSString stringWithFormat:@"%@",[self.multiplePracticesArray objectAtIndex:i] ];
//        CGRect frame = videoVC.view.frame;
//        frame.origin.x = i*self.view.frame.size.width;
//        videoVC.view.frame = frame;
//        [self addChildViewController:videoVC];
//        [self.videoContentsView addSubview:videoVC.view];
//        [videoVC didMoveToParentViewController:self];
        
    }
    
//    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [playButton addTarget:self
//                   action:@selector(tapPlay:)
//         forControlEvents:UIControlEventTouchUpInside];
//    playButton.frame = CGRectMake(0,0,100,100);
//    
//    [playButton setBackgroundImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
//    [self.videoContentsView addSubview:playButton];

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
