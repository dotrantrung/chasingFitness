//
//  CustomCellBuildWorkout.h
//  chasingFITness
//
//  Created by Trung Do on 2/22/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CustomCellBuildWorkout : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *exerciseImage;
@property (weak, nonatomic) IBOutlet UILabel *exerciseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberPickedLabel;
-(void) loadImage:(NSString*) name;
@end
