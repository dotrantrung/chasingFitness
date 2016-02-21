//
//  ListOfExcersises.m
//  chasingFITness
//
//  Created by Trung Do on 1/8/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "ListOfExercises.h"
#import "CustomCell.h"
#import "ListOfPractices.h"
@interface ListOfExercises ()
{
    NSArray *listNameArray;
    NSArray *listImageArray;
}
@end

@implementation ListOfExercises

- (void)viewDidLoad {
    [super viewDidLoad];
    listNameArray = [[NSArray alloc] initWithObjects:@"AGILITY", @"CORE", @"FULL BODY", @"LOWER BODY", @"UPPER BODY", nil];
    listImageArray = [[NSArray alloc] initWithObjects:@"Agility_Icon.jpg",@"Core_Icon.jpg",@"Full Body Icon_Icon.jpg",@"Lower Body_Icon.jpg",@"Upper Body_Icon.jpg", nil];
    // Do any additional setup after loading the view.
    [self.listExcersiseTable setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableView:)];
//    [self.listExcersiseTable addGestureRecognizer:tap];


    self.listExcersiseTable.delegate = self;
    self.listExcersiseTable.dataSource = self;
}
//-(void) didTapOnTableView:(UIGestureRecognizer*) recognizer {
//    CGPoint tapLocation = [recognizer locationInView:self.listExcersiseTable];
//    NSIndexPath *indexPath = [self.listExcersiseTable indexPathForRowAtPoint:tapLocation];
//    
//    if (indexPath) { //we are in a tableview cell, let the gesture be handled by the view
//        UIStoryboard *aStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//        
//        ListOfPractices* viewController = [aStoryboard instantiateViewControllerWithIdentifier:@"ListOfPractices"];
//        
//        
//        [self.navigationController pushViewController:viewController animated:YES];
//        recognizer.cancelsTouchesInView = NO;
//    } else { // anywhere else, do what is needed for your case
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [listNameArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"SimpleTableCell";
    CustomCell *cell= (CustomCell *)[tableView   dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){

        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];

    }
    
    cell.leftLabel.text = [listNameArray objectAtIndex:indexPath.row];
    
    cell.leftLabel.textColor =[UIColor whiteColor];
   
   
    cell.rightImage.image = [UIImage imageNamed:[listImageArray objectAtIndex:indexPath.row]];
    NSLog(@"%@", cell.leftLabel.text);
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ListOfPractices *practicesView = (ListOfPractices *) [storyboard instantiateViewControllerWithIdentifier:@"ListOfPractices"];
    practicesView.titleLabel.text =[listNameArray objectAtIndex:indexPath.row];
    [practicesView setModalPresentationStyle:UIModalPresentationFormSheet];
    practicesView.nameOfPractice = [NSString stringWithFormat:@"%@",[listNameArray objectAtIndex:indexPath.row] ];
//    
//    // Have the transition do a horizontal flip - my personal fav
//    [practicesView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:practicesView animated:YES];
    
    
}


@end
