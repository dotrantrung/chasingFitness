//
//  SelectTimerController.h
//  chasingFITness
//
//  Created by Trung Do on 1/14/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiVideoViewController.h"
@interface SelectTimerController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *numSetSegments;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *timeSelectionTable;
@property (strong, nonatomic) NSString *nameOfPractice;
@property NSArray * multiplePracticesArray;
@property int selectedTime;
@property int numSet;

@end
