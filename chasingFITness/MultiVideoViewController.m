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
- (void) runTimer{
    self.timer --;
    self.timerLabel.text = [NSString stringWithFormat:@"%d",self.timer];
    if (self.timer == 0)
        [self.timerObject invalidate];
    NSLog(@"haha");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.playerList = [[NSMutableArray alloc]init ];
//    self.playerViewList = [[NSMutableArray alloc]init ];
//
    self.timer = 100;
    self.timerLabel.text = [NSString stringWithFormat:@"%d",self.timer];

    self.timerObject = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                    target:self
                                                selector:@selector(runTimer)
                                                               userInfo:nil
                                                                repeats:YES];
     [self createAllViewScrollView];
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
    [layer setFrame:CGRectMake((index * self.view.frame.size.width),0,b, 300)];
    [layer setBackgroundColor:[UIColor redColor].CGColor];
    [layer setOpacity:0.75];
    [layer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    [self.videoContentsView.layer addSublayer: layer];
    
    [player play];
    
    
    //Exercise Name Label
    
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
