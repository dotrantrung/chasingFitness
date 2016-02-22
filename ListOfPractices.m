//
//  ListOfPractices.m
//  chasingFITness
//
//  Created by Trung Do on 1/12/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "ListOfPractices.h"

@interface ListOfPractices ()
{
    NSArray *listVideoName;
    NSArray *listVideoThumnail;
}
@end
@implementation ListOfPractices
- (void)viewDidLoad {
    [super viewDidLoad];
    
       // Do any additional setup after loading the view.
    self.dataReader = [[readData alloc] init];
    
    self.imageCollection.delegate = self;
    self.imageCollection.dataSource = self;

    
    self.titleLabel.text = self.nameOfPractice;
   
    [self findListOfVideoByName:self.nameOfPractice];
    
    
    [self.imageCollection reloadSections:[NSIndexSet indexSetWithIndex:0]];


}
-(void) findListOfVideoByName:(NSString*) nameOfBodyPart {
    listVideoName =[self.dataReader fetchedNameVideo:nameOfBodyPart];
    //listVideoThumnail =[self.dataReader fetchedNameThumnail:nameOfBodyPart];
    NSLog(@"number of cell:%lu",[listVideoName count]);
}
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  [listVideoName count];
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 //   NSLog(@"index : %ld",(long)indexPath.row);
    
   
    collectionCell *cell = (collectionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    [cell loadCell:listVideoName[indexPath.row]];
    cell.selected = NO;
    return cell;
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VideoView *videoVC = (VideoView *) [storyboard instantiateViewControllerWithIdentifier:@"VideoView"];
    int labelNumber = indexPath.row %10;

    videoVC.titleLabel.text =[listVideoName objectAtIndex:labelNumber];
    videoVC.nameOfVideo = [NSString stringWithFormat:@"%@",[listVideoName objectAtIndex:labelNumber] ];
    //
    //    // Have the transition do a horizontal flip - my personal fav
    //    [practicesView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:videoVC animated:YES];
}
- (IBAction)moveToBuildWorkout:(id)sender {
    UIStoryboard *aStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     buildWorkoutViewController* buildWorkoutVC = [aStoryboard instantiateViewControllerWithIdentifier:@"buildWorkoutVC"];
    

    [self.navigationController pushViewController:buildWorkoutVC animated:YES];
}




@end
