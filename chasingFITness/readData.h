//
//  readData.h
//  chasingFITness
//
//  Created by Trung Do on 2/2/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface readData : NSObject
@property (weak,nonatomic) NSDictionary* json;
-(void) readData;
- (NSString*)fetchedNameVideo:(NSString*) namePartOfBody;
- (NSString*)fetchedNameThumnail:(NSString*) nameThumnail;
- (NSString*)fetchedInstruction:(NSString*) nameVideo;
@end
