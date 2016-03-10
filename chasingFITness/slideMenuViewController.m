//
//  slideMenuViewController.m
//  chasingFITness
//
//  Created by Trung Do on 3/10/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "slideMenuViewController.h"

@implementation slideMenuViewController{
    NSArray *menu;
}
-(id) initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if(self){
        
    }
    return self;
}
-(void) viewDidLoad{
    [super viewDidLoad];
    menu = @[@"List of Exercises",@"Saved Routines", @"Contacts"];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [menu count];
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellIdentifier = @"menuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [menu objectAtIndex:indexPath.row];
    return cell;
}
@end
