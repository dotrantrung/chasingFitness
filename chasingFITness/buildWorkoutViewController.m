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
    return 6;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [listBodyPart objectAtIndex:(int) section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"buildWorkoutCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
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
    cell.textLabel.text = [a objectAtIndex:indexPath.row];
   
    cell.textLabel.textColor = [UIColor blackColor];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor whiteColor];

    
    if ([self.cellSelected containsObject:indexPath])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.textLabel.highlighted = YES;
        cell.contentView.backgroundColor = [UIColor blackColor];

    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.highlighted = NO;
        cell.contentView.backgroundColor = [UIColor whiteColor];

    }
    return cell;
}

- (IBAction)moveToSelectTimer:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SelectTimerController *selectTimerVC = (SelectTimerController *) [storyboard instantiateViewControllerWithIdentifier:@"selectTimerController"];
    [selectTimerVC setModalPresentationStyle:UIModalPresentationPopover];
    selectTimerVC.multiplePracticesArray = self.namePracticesSelected ;
    selectTimerVC.multiplePractices = YES;
     [self presentViewController:selectTimerVC animated:YES completion:NULL];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //if you want only one cell to be selected use a local NSIndexPath property instead of array. and use the code below
    //self.selectedIndexPath = indexPath;
    //the below code will allow multiple selection
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.textLabel.text;

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
