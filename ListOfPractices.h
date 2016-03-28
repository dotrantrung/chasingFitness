//
//  ListOfPractices.h
//  chasingFITness
//
//  Created by Trung Do on 1/12/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "readData.h"
#import "VideoView.h"
#import "collectionCell.h"
#import "SelectTimerController.h"
#import "buildWorkoutViewController.h"
@interface ListOfPractices : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *imageCollection;

@property (weak, nonatomic) IBOutlet UIButton *purchaseItemButton;

@property (strong, nonatomic) NSString *nameOfPractice;
@property (strong, nonatomic) readData *dataReader;

@end
