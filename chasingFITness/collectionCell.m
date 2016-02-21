//
//  collectionCell.m
//  chasingFITness
//
//  Created by Trung Do on 1/14/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "collectionCell.h"
#import <AVFoundation/AVFoundation.h>
@implementation collectionCell
-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //;
    }
    return self;
}
-(void) loadCell: (NSString*)name //and: (NSString*) imagePath{
{    [label setText:name];
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 0;
    UIImage *thumnail =[self generateThumbImage:name];
   [image setImage:thumnail];
    
    
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
