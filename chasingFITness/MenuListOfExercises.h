//
//  MenuListOfExercises.h
//  chasingFITness
//
//  Created by Trung Do on 3/31/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "readData.h"
#import "CustomCellBuildWorkout.h"
#import "SWRevealViewController.h"

@interface MenuListOfExercises : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (weak, nonatomic) IBOutlet UITableView *listOfExerciseTable;
@property readData * dataReader;
@end
