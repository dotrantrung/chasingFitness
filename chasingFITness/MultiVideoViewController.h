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
@property NSArray * multiplePracticesArray;
@property (weak, nonatomic) NSMutableArray* playerList;
@property (weak, nonatomic) NSMutableArray* playerViewList;


@end
