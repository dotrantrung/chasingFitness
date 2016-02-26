//
//  ViewController.m
//  chasingFITness
//
//  Created by Trung Do on 1/8/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   //[self createMenuBar];
    self.navigationController.navigationBar.translucent = NO;

    [self setUpMovie];
    }
- (void) createMenuBar{
    UIView *temp = [[myMenuView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, self.view.frame.size.height/3)];
    [self.view addSubview:temp];
                      
}
- (IBAction)moveToExercisesDemo:(id)sender {
    UIStoryboard *aStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
   
    ListOfExercises* viewController = [aStoryboard instantiateViewControllerWithIdentifier:@"listOfExercises"];

    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)moveToBuildWorkout:(id)sender {
    UIStoryboard *aStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    buildWorkoutViewController* viewController = [aStoryboard instantiateViewControllerWithIdentifier:@"buildWorkoutVC"];
    
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void) setUpMovie{
    AVPlayer *player1;
    AVPlayerClass *playerView1;
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"dumbbell walking lunges" withExtension:@"mov"];
    player1 =[AVPlayer playerWithURL:videoURL];
    [playerView1 setMovieToPlayer:player1];
    [player1 setMuted: true];
    
    AVPlayerLayer *layer = [AVPlayerLayer layer];
    float b =self.view.bounds.size.width;
    [layer setOpacity:0.8];
    [layer setSpeed:0.3];
    [layer setPlayer:player1];
    [layer setFrame:CGRectMake(0,0,b, self.videoView.frame.size.height/1.5)];
    [layer setBackgroundColor:[UIColor redColor].CGColor];
    [layer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    player1.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[player1 currentItem]];
    [self.videoView.layer addSublayer: layer];
    
    [player1 play];
    AVPlayer *player2;
    AVPlayerClass *playerView2;
    NSURL *videoURL2 = [[NSBundle mainBundle] URLForResource:@"bench knee flutter kicks to knee crunches" withExtension:@"mov"];
    player2 =[AVPlayer playerWithURL:videoURL2];
    [playerView2 setMovieToPlayer:player2];
    [player2 setMuted: true];
    
    AVPlayerLayer *layer2 = [AVPlayerLayer layer];
    [layer2 setOpacity:0.8];
    [layer2 setSpeed:0.95];
    [layer2 setPlayer:player2];
    [layer2 setFrame:CGRectMake(0,self.videoView.frame.size.height/2,b, self.videoView.frame.size.height/1.5)];
    [layer2 setBackgroundColor:[UIColor redColor].CGColor];
    [layer2 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    player2.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[player2 currentItem]];
    [self.videoView.layer addSublayer: layer2];
    
    [player2 play];
}
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}


@end
