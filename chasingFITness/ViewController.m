//
//  ViewController.m
//  chasingFITness
//
//  Created by Trung Do on 1/8/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#define kMySubscriptionFeature @"com.Patera.chasingFITness.fullaccess"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   //[self createMenuBar];
    self.navigationController.navigationBar.translucent = NO;
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sideBarButton setTarget: self.revealViewController];
        [self.sideBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    [self setUpMovie];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"purchased"])
    {
        [self.purchaseButton setTitle:@"Full Access Subscription" forState:UIControlStateNormal];
        [self.purchaseButton setBackgroundColor:[UIColor brownColor]];
        [self.purchaseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
          }
    else {
        [self.purchaseButton setTitle:@"Purchase full access" forState:UIControlStateNormal];

    }
}
- (IBAction)tapPurchase:(id)sender {
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"purchased"]){
        PurchaseViewController *temp = [[PurchaseViewController alloc]initWithNibName:nil bundle:nil];
        temp.productID = kMySubscriptionFeature;
        [self presentViewController:temp animated:YES completion:nil];
        [temp getProductID];

    }
    else{
        [self.purchaseButton setTitle:@"Full Access Subscription" forState:UIControlStateNormal];
        [self.purchaseButton setBackgroundColor:[UIColor brownColor]];
        [self.purchaseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }
    
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
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"Bench knee flutter kicks to knee crunches" withExtension:@"mov"];
    player1 =[AVPlayer playerWithURL:videoURL];
    [playerView1 setMovieToPlayer:player1];
    [player1 setMuted: true];
    
    AVPlayerLayer *layer = [AVPlayerLayer layer];
    float b =self.view.bounds.size.width;
    float c =self.view.bounds.size.height*0.8;

    [layer setSpeed:0.3];
    [layer setPlayer:player1];
    [layer setFrame:CGRectMake(0,0,b, c/2)];
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
    NSURL *videoURL2 = [[NSBundle mainBundle] URLForResource:@"Dumbbell walking lunges"  withExtension:@"mov"];
    player2 =[AVPlayer playerWithURL:videoURL2];
    [playerView2 setMovieToPlayer:player2];
    [player2 setMuted: true];
    
    AVPlayerLayer *layer2 = [AVPlayerLayer layer];
    [layer2 setSpeed:0.95];
    [layer2 setPlayer:player2];
    [layer2 setFrame:CGRectMake(0,c/2,b, c/2)];
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
