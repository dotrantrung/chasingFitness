//
//  CustomWorkoutSetClass.m
//  chasingFITness
//
//  Created by Trung Do on 4/3/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "CustomWorkoutSetClass.h"

@implementation CustomWorkoutSetClass
@synthesize name = _name;
@synthesize allPracticesArray = _allPracticesArray;
@synthesize numSet = _numSet;
@synthesize setTime = _setTime;
- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.allPracticesArray forKey:@"allPracticesArray"];
    [encoder encodeObject:[NSNumber numberWithInt:self.numSet] forKey:@"numberOfSet"];
    [encoder encodeObject:[NSNumber numberWithInt:self.setTime] forKey:@"timeForEachSet"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.name = [decoder decodeObjectForKey:@"name"];
        self.numSet = [[decoder decodeObjectForKey:@"numberOfSet"] intValue];
        self.setTime = [[decoder decodeObjectForKey:@"timeForEachSet"] intValue];

        self.allPracticesArray = [decoder decodeObjectForKey:@"allPracticesArray"];
    }
    return self;
}
- (void) printDetails{
    NSLog(@"Name: %@", self.name);
    for (int i =0; i< [self.allPracticesArray count]; i++){
        NSLog (@"# %d : %@", i+1, [self.allPracticesArray objectAtIndex:i]);
    }
}
@end
