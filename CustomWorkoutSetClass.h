//
//  CustomWorkoutSetClass.h
//  chasingFITness
//
//  Created by Trung Do on 4/3/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomWorkoutSetClass : NSObject
@property NSString *name;
@property NSArray *allPracticesArray;
@property int setTime;
@property int numSet;
-(void) printDetails;


@end
