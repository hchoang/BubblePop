//
//  ScoreViewController.h
//  BubblePop
//
//  Created by Huy Cat Hoang on 10/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "constant.h"
#import "ScoreRowCell.h"
#import "AppDelegate.h"

@interface ScoreViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *scoreTableView;
@property (strong, nonatomic) NSArray * highScore;

@end
