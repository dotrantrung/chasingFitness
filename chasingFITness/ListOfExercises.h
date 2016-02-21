//
//  ListOfExcersises.h
//  chasingFITness
//
//  Created by Trung Do on 1/8/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myMenuView.h"
@interface ListOfExercises : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *listExcersiseTable;
@property (weak, nonatomic) IBOutlet myMenuView *menuView;

@end
