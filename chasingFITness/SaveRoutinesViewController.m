//
//  SaveRoutinesViewController.m
//  chasingFITness
//
//  Created by Trung Do on 4/9/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "SaveRoutinesViewController.h"

@implementation SaveRoutinesViewController
- (void) viewDidLoad{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sideBarButton setTarget: self.revealViewController];
        [self.sideBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    [self loadData];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor blackColor];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.routinesArray removeObjectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.routinesArray] forKey:@"savedRoutines"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
- (void) loadData{
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [currentDefaults objectForKey:@"savedRoutines"];
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *temp = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        NSLog(@"Size:%lu", [self.routinesArray count]);
        self.routinesArray = [temp mutableCopy];
        for (int i =0; i <[self.routinesArray count]; i++){
            [[self.routinesArray objectAtIndex:i] printDetails];
        }
    }
//    NSMutableArray *emptyArray = [[NSMutableArray alloc]init];
//    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:emptyArray] forKey:@"savedArray"];
//    [[NSUserDefaults standardUserDefaults] synchronize];

   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.routinesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomSavedRoutinesCell";
    CustomSavedRoutinesCell *cell= (CustomSavedRoutinesCell *)[tableView   dequeueReusableCellWithIdentifier:cellIdentifier];
//    [self.tableView registerNib:[UINib nibWithNibName:@"CustomSavedRoutinesCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];

    if (cell == nil){
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }

   [cell loadInfo:[self.routinesArray objectAtIndex:indexPath.row]];
    cell.backgroundColor = [UIColor blackColor];

    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomWorkoutSetClass *pickedRow = [self.routinesArray objectAtIndex:indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MultiVideoViewController *multiVideoVC = (MultiVideoViewController *) [storyboard instantiateViewControllerWithIdentifier:@"MultiVideoViewController"];
    multiVideoVC.setTime = pickedRow.setTime;
    multiVideoVC.numberOfSet = pickedRow.numSet;
    multiVideoVC.multiplePracticesArray = pickedRow.allPracticesArray;
    
    [self.navigationController pushViewController:multiVideoVC animated:YES];
    
    //
    //    // Have the transition do a horizontal flip - my personal fav
    //    [practicesView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    // Pass the selected object to the new view controller.

    
}

@end
