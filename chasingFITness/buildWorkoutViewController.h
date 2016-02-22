//
//  buildWorkoutViewController.h
//  chasingFITness
//
//  Created by Trung Do on 2/3/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "readData.h"
#import "SelectTimerController.h"
#import "CustomCellBuildWorkout.h"

@interface buildWorkoutViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *choosingTableView;
@property (strong, nonatomic) NSMutableArray*cellSelected;
@property (strong, nonatomic) readData *dataReader;
@property (strong, nonatomic) NSMutableArray*namePracticesSelected;

@end
