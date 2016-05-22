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
    label.textColor = [UIColor whiteColor];
    NSString *nameImage = [NSString stringWithFormat:@"%@.jpg",name];
    UIImage *thumnail =[UIImage imageNamed:nameImage];
   [image setImage:thumnail];
    hiddenView.hidden = true;
    
    
}
-(void) hideView{
    hiddenView.hidden = false;
    [label setText:@"Purchase for full access"];
    [label setTextColor:[UIColor whiteColor]];
}
-(void) showView:(NSString*)videoName{
    hiddenView.hidden = true;
    [label setText:videoName];
    [label setTextColor:[UIColor whiteColor]];

}

@end
