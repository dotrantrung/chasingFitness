//
//  MultiVideoViewViewController.h
//  chasingFITness
//
//  Created by Trung Do on 2/23/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoCustomView.h"
#import "VideoView.h"
@interface MultiVideoViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *videoContentsView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveThisPracticeButton;
@property NSArray * multiplePracticesArray;
//@property  (weak,nonatomic)NSMutableArray* playerList;
//@property  (weak,nonatomic)NSMutableArray* playerViewList;
@property int breakTime;
@property int transitionTime;
@property int setTime;
@property int numberOfSet;
@property int tempNumOfSet;
@property int currentExerciseIndex;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *clockTimer;
@property int timer;
@property NSTimer * timerObject;
-(void) runTimer;
@end
