
//
//  VideoView.m
//  chasingFITness
//
//  Created by Trung Do on 1/18/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "VideoView.h"

@interface VideoView ()
@end

@implementation VideoView
@synthesize player;
@synthesize playerView;
- (void) setUpMovie{
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:self.nameOfVideo withExtension:@"mov"];
    self.player =[AVPlayer playerWithURL:videoURL];
    [self.playerView setMovieToPlayer:player];
    AVPlayerLayer *layer = [AVPlayerLayer layer];
    float b =self.view.frame.size.width;

    [layer setPlayer:self.player];
    [layer setFrame:CGRectMake(0,0,b, self.videoView.layer.frame.size.height)];
    [layer setBackgroundColor:[UIColor redColor].CGColor];
    [layer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    [self.videoView.layer addSublayer: layer];
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButton addTarget:self
               action:@selector(tapPlay:)
     forControlEvents:UIControlEventTouchUpInside];
    float a =layer.frame.size.height/2;
    playButton.frame = CGRectMake(self.view.bounds.size.width/2-(a/2),self.videoView.layer.position.y-(a/2), a , a);

    [playButton setBackgroundImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
    [self.view addSubview:playButton];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpMovie];
    self.dataReader = [[readData alloc] init];
    
    self.titleLabel.text = self.nameOfVideo;
   // NSString* a = [self.dataReader fetchedInstruction:self.nameOfVideo];
    
    self.instructionLabel.text =[self.dataReader fetchedInstruction:self.nameOfVideo];
}

- (IBAction)tapPlay:(id)sender {
    UIButton * a = (UIButton*) sender;
    a.hidden = YES;
    [self.player play];
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
