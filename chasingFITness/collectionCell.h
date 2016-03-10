//
//  collectionCell.h
//  chasingFITness
//
//  Created by Trung Do on 1/14/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface collectionCell : UICollectionViewCell
{
    IBOutlet UIImageView *image;
    IBOutlet UILabel *label;
    IBOutlet UIView *hiddenView;
}
-(void) loadCell: (NSString*)name;
             //and: (NSString*) imagePath;
-(void) hiddenView;

@end
