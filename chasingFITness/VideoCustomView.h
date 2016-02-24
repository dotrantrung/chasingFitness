//
//  VideoCustomView.h
//  chasingFITness
//
//  Created by Trung Do on 2/23/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AVPlayerClass.h"

@interface VideoCustomView : UIView
@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@property (nonatomic, retain) AVPlayer *player;
@property (weak, nonatomic) AVPlayerClass *playerView;

- (void) loadView:(NSString*) excerciseName;
@end
