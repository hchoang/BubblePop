//
//  ScoreViewController.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 10/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "ScoreViewController.h"

@implementation ScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.highScore = appDelegate.game.highScore;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.highScore count] > MAX_ROW) {
        return MAX_ROW;
    } else {
        return [self.highScore count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScoreRowCell *cell = [tableView dequeueReusableCellWithIdentifier:SCORE_ROW_IDENTIFIER];
    if (cell == nil) {
        cell = [[ScoreRowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SCORE_ROW_IDENTIFIER];
    }
    NSDictionary * score = [self.highScore objectAtIndex:indexPath.row];
    cell.nameLabel.text = [score objectForKey:DICTIONARY_NAME_KEY];
    cell.scoreLabel.text = [(NSNumber *) [score objectForKey:DICTIONARY_SCORE_KEY] stringValue];
    
    return cell;
}

@end
