//
//  ViewController.m
//  chasingFITness
//
//  Created by Trung Do on 1/8/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   //[self createMenuBar];
    }
- (void) createMenuBar{
    UIView *temp = [[myMenuView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, self.view.frame.size.height/3)];
    [self.view addSubview:temp];
                      
}
- (IBAction)moveToExercisesDemo:(id)sender {
    UIStoryboard *aStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
   
    ListOfExercises* viewController = [aStoryboard instantiateViewControllerWithIdentifier:@"listOfExercises"];

    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)moveToBuildWorkout:(id)sender {
    UIStoryboard *aStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    buildWorkoutViewController* viewController = [aStoryboard instantiateViewControllerWithIdentifier:@"buildWorkoutVC"];
    
    
    [self.navigationController pushViewController:viewController animated:YES];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}


@end
