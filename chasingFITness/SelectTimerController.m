//
//  SelectTimerController.m
//  chasingFITness
//
//  Created by Trung Do on 1/14/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "SelectTimerController.h"
#import "VideoView.h"
#import "ListOfPractices.h"
@interface SelectTimerController ()
{
    NSArray *timeOptionArray;
}
@end

@implementation SelectTimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // timeOptionArray = [[NSArray alloc] initWithObjects:30 ,45, 60,75, 90,120, nil];
    timeOptionArray = @[@30, @45, @60, @75, @90, @120];

  [self test];
    for (int i=0; i < [self.multiplePracticesArray count]; i++){
            NSLog(@"%@\n",[self.multiplePracticesArray objectAtIndex:i]);
        
    }
    self.numSet = 4;
    self.selectedTime = 30;
    self.navigationItem.title = @"Time for each set";
    self.timeSelectionTable.delegate = self;
    self.timeSelectionTable.dataSource = self;
}
-(void) test{
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [currentDefaults objectForKey:@"RoutineSaved"];
    if (dataRepresentingSavedArray != nil)
    {
    NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
    NSLog(@"Size: %lu", [oldSavedArray count]);
    //    if (oldSavedArray != nil)
//        objectArray = [[NSMutableArray alloc] initWithArray:oldSavedArray];
//    else
//        objectArray = [[NSMutableArray alloc] init];
}
//    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
//    NSData *dataRepresentingSavedArray = [currentDefaults objectForKey:@"savedArray"];
//    NSMutableArray *objectArray;
//    if (dataRepresentingSavedArray != nil)
//    {
//        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
//       // NSLog(@"Size: %lu", [oldSavedArray count]);
//
////        if (oldSavedArray != nil)
////            objectArray = [[NSMutableArray alloc] initWithArray:oldSavedArray];
////        else
////            objectArray = [[NSMutableArray alloc] init];
//    }
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [timeOptionArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"timeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textAlignment = NSTextAlignmentCenter;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ seconds", [timeOptionArray objectAtIndex:indexPath.row]];
    cell.textLabel.textColor = [UIColor redColor];
    cell.backgroundColor = [UIColor blackColor];
    cell.contentView.backgroundColor = [UIColor blackColor];

    if (indexPath.row == 0){
        [self.timeSelectionTable selectRowAtIndexPath:indexPath animated:YES  scrollPosition:UITableViewScrollPositionBottom];
        [self.timeSelectionTable cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    }

    
    
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    NSNumber *cellText = [timeOptionArray objectAtIndex:indexPath.row];
    self.selectedTime = [cellText intValue];
    NSLog(@"%d", self.selectedTime);
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}
- (IBAction)tapMoveToMultiVideoVC:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MultiVideoViewController    *multiVideoVC = (MultiVideoViewController*) [storyboard instantiateViewControllerWithIdentifier:@"MultiVideoViewController"];
  //3  self.timeSelectionTable.
    multiVideoVC.setTime = self.selectedTime;
    multiVideoVC.numberOfSet = self.numSet;
    multiVideoVC.multiplePracticesArray = self.multiplePracticesArray;
    
    [self.navigationController pushViewController:multiVideoVC animated:YES];
}
- (IBAction)setSegmentValueChanged:(UISegmentedControl *)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            self.numSet = 4;
            break;
        case 1:
            self.numSet = 5;
            break;
        case 2:
            self.numSet = 6;
            break;
        default:
            self.numSet = 4;
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
