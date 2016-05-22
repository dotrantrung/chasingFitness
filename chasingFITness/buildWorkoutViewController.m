//
//  buildWorkoutViewController.m
//  chasingFITness
//
//  Created by Trung Do on 2/3/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "buildWorkoutViewController.h"

@interface buildWorkoutViewController ()
{
    NSArray *listBodyPart;
    NSArray *agility;
    NSArray *core;
    NSArray *fullbody;
    NSArray *lowerbody;
    NSArray *upperbody;

}
@end
@implementation buildWorkoutViewController

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

    
    self.choosingTableView.multipleTouchEnabled = true;
    // Do any additional setup after loading the view, typically from a nib.
    self.cellSelected = [NSMutableArray array];
    self.namePracticesSelected = [NSMutableArray array];
    self.choosingTableView.delegate = self;
    self.choosingTableView.dataSource = self;
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
            cell.userInteractionEnabled = YES;

        }
        else{
            cell.hiddenPurchaseLabel.hidden = false;
            cell.userInteractionEnabled = NO;
           // cell.selectionStyle =UITableViewCellSelectionStyle.None;
        }
    }
    else {
        cell.hiddenPurchaseLabel.hidden = true;
        cell.userInteractionEnabled = YES;
    }
    
    if ([self.cellSelected containsObject:indexPath])
    {
        cell.numberPickedLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)[self.cellSelected indexOfObject:indexPath]+1 ];
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.numberPickedLabel.hidden = false;
    }
    else
    {
        cell.numberPickedLabel.text = @"";
        cell.backgroundColor = [UIColor whiteColor];
       cell.numberPickedLabel.hidden  = true;
    }
    return cell;
}

- (IBAction)moveToTimerSelection:(id)sender {
    if ([self.namePracticesSelected count] == 0){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"EXERCISE ?" message:@"Choose an exercise to build your workout session."
                                    preferredStyle:UIAlertControllerStyleAlert];
        //We add buttons to the alert controller by creating UIAlertActions:
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil]; //You can use a block here to handle a press on this button
        [alertController addAction:actionOk];
        [self presentViewController:alertController animated:YES completion:nil];

    }
    else{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SelectTimerController *selectTimerVC = (SelectTimerController *) [storyboard instantiateViewControllerWithIdentifier:@"SelectTimerController"];
        selectTimerVC.multiplePracticesArray = self.namePracticesSelected;
        
        //
        //    // Have the transition do a horizontal flip - my personal fav
        //    [practicesView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        // Pass the selected object to the new view controller.
        [self.navigationController pushViewController:selectTimerVC animated:YES];
        
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //if you want only one cell to be selected use a local NSIndexPath property instead of array. and use the code below
    //self.selectedIndexPath = indexPath;
    //the below code will allow multiple selection
    CustomCellBuildWorkout *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.exerciseNameLabel.text;
   
    
    if ([self.cellSelected containsObject:indexPath])
    {
        
        [self.cellSelected removeObject:indexPath];
        [self.namePracticesSelected removeObject:cellText ];
    }
    else
    {
       
        [self.cellSelected addObject:indexPath];
        [self.namePracticesSelected addObject:cellText ];
    }
    NSLog(@"count: %lu",[self.namePracticesSelected count]);
    [tableView reloadData];
}
@end
