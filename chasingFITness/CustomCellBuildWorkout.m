//
//  CustomCellBuildWorkout.m
//  chasingFITness
//
//  Created by Trung Do on 2/22/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "CustomCellBuildWorkout.h"

@implementation CustomCellBuildWorkout

@synthesize exerciseNameLabel = _exerciseNameLabel;
@synthesize exerciseImage = _exerciseImage;
- (void)awakeFromNib {
    // Initialization code
    
}
-(void) loadImage:(NSString*) name{
    UIImage *thumnail =[self generateThumbImage:name];
    [self.exerciseImage setImage:thumnail];
}

-(UIImage *)generateThumbImage : (NSString *)filepath
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:filepath withExtension:@"mov"];
    // NSURL *url = [NSURL fileURLWithPath:filepath];
    
    AVAsset *asset = [AVAsset assetWithURL:url];
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc]initWithAsset:asset];
    CMTime time = [asset duration];
    time.value = 50;
    CGImageRef imageRef = [imageGenerator copyCGImageAtTime:time actualTime:NULL error:NULL];
    UIImage *thumbnail = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);  // CGImageRef won't be released by ARC
    
    return thumbnail;
}

@end
