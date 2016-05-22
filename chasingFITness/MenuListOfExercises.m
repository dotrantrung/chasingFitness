//
//  MenuListOfExercises.m
//  chasingFITness
//
//  Created by Trung Do on 3/31/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "MenuListOfExercises.h"

@interface MenuListOfExercises ()
{
    NSArray *listBodyPart;
    NSArray *agility;
    NSArray *core;
    NSArray *fullbody;
    NSArray *lowerbody;
    NSArray *upperbody;
    
}
@end
@implementation MenuListOfExercises

- (void)viewDidLoad
{
    [super viewDidLoad];
    listBodyPart = [[NSArray alloc] initWithObjects:@"AGILITY", @"CORE", @"FULL BODY", @"LOWER BODY", @"UPPER BODY", nil];
    self.dataReader = [[readData alloc] init];
    agility =[self.dataReader fetchedNameVideo:[listBodyPart objectAtIndex:0]];
    core =[self.dataReader fetchedNameVideo:[listBodyPart objectAtIndex:1]];
    fullbody =[self.dataReader fetchedNameVideo:[listBodyPart objectAtIndex:2]];
    lowerbody =[self.dataReader fetchedNameVideo:[listBodyPart objectAtIndex:3]];
    upperbody =[self.dataReader fetchedNameVideo:[listBodyPart objectAtIndex:4]];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sideBarButton setTarget: self.revealViewController];
        [self.sideBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.listOfExerciseTable.delegate = self;
    self.listOfExerciseTable.dataSource = self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [listBodyPart count];
    
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Background color
    view.tintColor = [UIColor blackColor];
    
    // Text Color
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor redColor]];
    
    // Another way to set the background color
    // Note: does not preserve gradient effect of original header
    // header.contentView.backgroundColor = [UIColor blackColor];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* a;
    switch (section){
        case 0:
            a = agility;
            break;
        case 1:
            a = core;
            break;
        case 2:
            a = fullbody;
            break;
        case 3:
            a = lowerbody;
            break;
        case 4:
            a = upperbody;
            break;
        default:
            break;
    };
    
    return [a count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [listBodyPart objectAtIndex:(int) section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomCellBuildWorkout";
    CustomCellBuildWorkout *cell= (CustomCellBuildWorkout *)[tableView   dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    NSArray* a;
    switch (indexPath.section){
        case 0:
            a = agility;
            break;
        case 1:
            a = core;
            break;
        case 2:
            a = fullbody;
            break;
        case 3:
            a = lowerbody;
            break;
        case 4:
            a = upperbody;
            break;
        default:
            break;
    };
    cell.exerciseNameLabel.text = [a objectAtIndex:indexPath.row];
    [cell loadImage:[a objectAtIndex:indexPath.row]];
    
    cell.exerciseNameLabel.textColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor whiteColor];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"purchased"]) {
        if (indexPath.row == 0){
            cell.hiddenPurchaseLabel.hidden = true;
            
        }
        else{
            cell.hiddenPurchaseLabel.hidden = false;
        }
    }
    else {
        cell.hiddenPurchaseLabel.hidden = true;
    }
    cell.userInteractionEnabled = NO;
    
    return cell;
}




@end
