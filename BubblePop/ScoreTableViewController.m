//
//  ScoreTableViewController.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 9/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "ScoreTableViewController.h"

@implementation ScoreTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = @"This is a cell";
    
    return cell;
}

@end
