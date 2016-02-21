//
//  AVPlayerClass.h
//  chasingFITness
//
//  Created by Trung Do on 1/20/16.
//  Copyright © 2016 Patera. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class AVPlayer;
@interface AVPlayerClass : UIView

@property (nonatomic,retain) AVPlayer* player;
- (void) setMovieToPlayer:(AVPlayer *) player;
@end
