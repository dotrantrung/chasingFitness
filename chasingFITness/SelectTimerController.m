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
    timeOptionArray = [[NSArray alloc] initWithObjects:@"30 secs",@"60 secs", @"90 secs", @"12 reps", @"16 reps" , @"24 reps", nil];
  
        self.titleLabel.text = [NSString stringWithFormat:@"Set time for %lu practices",[self.multiplePracticesArray count]];
    for (int i=0; i < [self.multiplePracticesArray count]; i++){
            NSLog(@"%@\n",[self.multiplePracticesArray objectAtIndex:i]);
        
    }
   
    self.timeSelectionTable.delegate = self;
    self.timeSelectionTable.dataSource = self;
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
    cell.textAlignment= UITextAlignmentCenter;
    
    cell.textLabel.text = [timeOptionArray objectAtIndex:indexPath.row];
    if (indexPath.row < 3)
        cell.textLabel.textColor = [UIColor redColor];
    else
        cell.textLabel.textColor = [UIColor blackColor];

  
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor whiteColor];
    
    
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)tableView:(UITableView *)tableView
//didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    VideoView    *aaa = (VideoView*) [storyboard instantiateViewControllerWithIdentifier:@"videoViewController"];
//    //videoViewController
//    [aaa setModalPresentationStyle:UIModalPresentationFormSheet];
//    //
//    //    // Have the transition do a horizontal flip - my personal fav
//    [aaa setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
//    
//    aaa.multiplePractices =YES;
//    aaa.multiplePracticesArray = self.multiplePracticesArray;
//    
//    // Pass the selected object to the new view controller.
//    [self presentViewController:aaa animated:YES completion:NULL];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
