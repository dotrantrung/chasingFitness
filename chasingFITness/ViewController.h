//
//  ViewController.h
//  chasingFITness
//
//  Created by Trung Do on 1/8/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myMenuView.h"
#import "ListOfExercises.h"
#import "buildWorkoutViewController.h"
@interface ViewController : UIViewController //<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet myMenuView *menuView;


@end

