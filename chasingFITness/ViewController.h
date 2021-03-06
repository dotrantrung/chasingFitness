//
//  ViewController.h
//  chasingFITness
//
//  Created by Trung Do on 1/8/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListOfExercises.h"
#import <StoreKit/StoreKit.h>
#import "buildWorkoutViewController.h"
#import "PurchaseViewController.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UIButton *purchaseButton;
@end

