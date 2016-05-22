//
//  CustomSavedRoutinesCell.h
//  chasingFITness
//
//  Created by Trung Do on 4/9/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomWorkoutSetClass.h"
@interface CustomSavedRoutinesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *routineNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *routineListLabel;
@property (weak, nonatomic) IBOutlet UILabel *routineTimeLabel;
- (void) loadInfo:(CustomWorkoutSetClass*) aRoutine;
@end
