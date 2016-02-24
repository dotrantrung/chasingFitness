//
//  MultiVideoViewViewController.m
//  chasingFITness
//
//  Created by Trung Do on 2/23/16.
//  Copyright © 2016 ;. All rights reserved.
//

#import "MultiVideoViewController.h"

@interface MultiVideoViewController ()

@end

@implementation MultiVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createAllViewScrollView];
}
-(void) createAllViewScrollView{
    float b =self.view.frame.size.width;
    self.videoContentsView.contentSize = CGSizeMake(b,[self.multiplePracticesArray count] * 400);
    
 
    for (int i=0; i<[self.multiplePracticesArray count]; i++){
        VideoCustomView *temp = [[VideoCustomView alloc] init];
        [temp loadView:[self.multiplePracticesArray objectAtIndex:i]];
        [temp setFrame:CGRectMake(0,i*400, b, 400)];
        [self.videoContentsView addSubview:temp];
        //[self.view addSubview: temp];
    }
    
//    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [playButton addTarget:self
//                   action:@selector(tapPlay:)
//         forControlEvents:UIControlEventTouchUpInside];
//    playButton.frame = CGRectMake(0,0,100,100);
//    
//    [playButton setBackgroundImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
//    [self.videoContentsView addSubview:playButton];

    self.videoContentsView.delegate = self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
