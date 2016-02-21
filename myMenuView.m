//
//  myMenuView.m
//  chasingFITness
//
//  Created by Trung Do on 1/11/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "myMenuView.h"

@implementation myMenuView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.view = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.view];
        self.dropDownTable.hidden = YES;
         self.menuArray = [[NSArray alloc] initWithObjects:@"exercise list",@"bonus excercises",@"saved workouts",@"contacts", nil];
        self.dropDownTable.delegate = self;
        self.dropDownTable.dataSource = self;
        return self;
    }
    return nil;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.menuArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"dropDown";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textAlignment= UITextAlignmentCenter;
    
    cell.textLabel.text = [self.menuArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    //cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5f];
    cell.tintColor = [UIColor blackColor];
    
    
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)tapDropDown:(id)sender {
    if (self.dropDownTable.hidden == YES)
        self.dropDownTable.hidden = NO;
    else
        self.dropDownTable.hidden = YES;
}
@end
