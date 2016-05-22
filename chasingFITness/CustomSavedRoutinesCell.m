//
//  CustomSavedRoutinesCell.m
//  chasingFITness
//
//  Created by Trung Do on 4/9/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "CustomSavedRoutinesCell.h"

@implementation CustomSavedRoutinesCell
- (void)awakeFromNib {
    // Initialization code
    
}
-(void) loadInfo:(CustomWorkoutSetClass*) aRoutine{
    self.routineNameLabel.text = [NSString stringWithFormat:@"%@", aRoutine.name];
    self.routineNameLabel.layer.masksToBounds = YES;
    self.routineNameLabel.layer.cornerRadius = 8.0;
    
    NSString *tempList = @"";

    for (int i =0; i< [aRoutine.allPracticesArray count] ; i++){
        tempList = [tempList stringByAppendingString:[NSString stringWithFormat:@"%d) %@ \n", i+1, [aRoutine.allPracticesArray objectAtIndex:i]]] ;
    }
    self.routineListLabel.text = [NSString stringWithFormat:@"%@", tempList];
    self.routineTimeLabel.text = [NSString stringWithFormat:@"%d secs/ set \n%d sets/ exercise",aRoutine.setTime, aRoutine.numSet];
    
}

@end
