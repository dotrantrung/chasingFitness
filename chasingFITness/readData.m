//
//  readData.m
//  chasingFITness
//
//  Created by Trung Do on 2/2/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "readData.h"

@implementation readData
-(id) init{
    self = [super init];
    if (self)
    {
        [self readData];
        
    }
    return self;
}
-(void) readData{
    
    NSURL *jsonURL = [[NSBundle mainBundle] URLForResource:@"TextData" withExtension:@"json"];
    NSData* responseData = [NSData dataWithContentsOfURL:
                            jsonURL];
    //    [self performSelectorOnMainThread:@selector(fetchedData:)withObject:data waitUntilDone:YES];
    
    
    //parse out the json data
    NSLog(@"go here read data");
    
    NSError* error;
    self.json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          options:kNilOptions
                          error:&error];

}
//(NSData *)responseData
- (NSString*)fetchedNameVideo:(NSString*) namePartOfBody{
   
    NSArray* items = [self.json valueForKeyPath:@"practices"]; //2
    NSMutableArray* returnArray = [[NSMutableArray alloc] init];

    for (NSDictionary *item in items){
        if([[item objectForKey:@"bodypart"] isEqualToString:namePartOfBody])
        {
            [returnArray addObject:[item objectForKey:@"name"]];
        }
    }
    return returnArray;

}
//- (NSString*)fetchedNameThumnail:(NSString*) namePartOfBody{
//    
//    NSArray* items = [self.json valueForKeyPath:@"practices"]; //2
//    NSMutableArray* returnArray = [[NSMutableArray alloc] init];
//    
//    for (NSDictionary *item in items){
//        if([[item objectForKey:@"bodypart"] isEqualToString:namePartOfBody])
//        {
//            [returnArray addObject:[item objectForKey:@"thumnail"]];
//        }
//    }
//    return returnArray;
//
//}
- (NSString*)fetchedInstruction:(NSString*) nameVideo{
    NSArray* items = [self.json valueForKeyPath:@"practices"];
    
    for (NSDictionary *item in items){
        if([[item objectForKey:@"name"] isEqualToString:nameVideo])
        {
            return [item objectForKey:@"description"];
        }
    }
    return nil;
}

@end
