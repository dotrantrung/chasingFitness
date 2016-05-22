//
//  SaveRoutinesViewController.h
//  chasingFITness
//
//  Created by Trung Do on 4/9/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "CustomWorkoutSetClass.h"
#import "CustomSavedRoutinesCell.h"
#import "MultiVideoViewController.h"
@interface SaveRoutinesViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (strong, nonatomic) IBOutlet UITableView *savedRoutinesTableView;
@property NSMutableArray *routinesArray;

@end
