//
//  ContactsViewController.m
//  chasingFITness
//
//  Created by Trung Do on 3/28/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "ContactsViewController.h"
#import "SWRevealViewController.h"
@implementation ContactsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self createMenuBar];
    self.navigationController.navigationBar.translucent = NO;
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sideBarButton setTarget: self.revealViewController];
        [self.sideBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}
@end
