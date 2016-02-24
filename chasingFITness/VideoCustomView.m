//
//  VideoCustomView.m
//  chasingFITness
//
//  Created by Trung Do on 2/23/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "VideoCustomView.h"

@implementation VideoCustomView
@synthesize titleLabel = _titleLabel;
@synthesize videoView = _videoView;
@synthesize instructionLabel = _instructionLabel;

- (void)awakeFromNib {
    // Initialization code
}
- (id)init
{
    self = [super init];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.view = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.view];
        return self;
    }
    return nil;
}
- (void)loadView:(NSString*) exerciseName{
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:exerciseName withExtension:@"mov"];
    NSLog(@"Gohere");
    self.player =[AVPlayer playerWithURL:videoURL];
    [self.playerView setMovieToPlayer:self.player];
    [self.player setVolume:0.0];
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
    playButton.frame = CGRectMake(self.view.frame.size.width/2-(a/2),self.videoView.layer.position.y-(a/2), a , a);
    
    [playButton setBackgroundImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
    [self.videoView addSubview:playButton];
    
    
    //Exercise Name Label
    self.titleLabel.text = exerciseName;
    
}
- (IBAction)tapPlay:(id)sender {
    UIButton * a = (UIButton*) sender;
    a.hidden = YES;
    [self.player play];
}
@end
