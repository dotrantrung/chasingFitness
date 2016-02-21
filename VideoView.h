//
//  VideoView.h
//  chasingFITness
//
//  Created by Trung Do on 1/18/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AVPlayerClass.h"
#import "myMenuView.h"
#import "readData.h"
@interface VideoView : UIViewController


@property (nonatomic, retain) AVPlayer *player;
@property (weak, nonatomic) AVPlayerClass *playerView;
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet myMenuView *dropDownMenu;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@property (strong, nonatomic) readData *dataReader;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (strong, nonatomic) NSString *nameOfVideo;
@property Boolean multiplePractices;
@property NSArray * multiplePracticesArray;
@end
