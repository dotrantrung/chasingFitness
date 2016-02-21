//
//  myMenuView.h
//  chasingFITness
//
//  Created by Trung Do on 1/11/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myMenuView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UITableView *dropDownTable;

@property (strong, nonatomic) NSArray *menuArray;
- (IBAction)tapDropDown:(id)sender;

@end
