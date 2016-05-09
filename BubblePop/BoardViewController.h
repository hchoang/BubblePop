//
//  BoardViewController.h
//  BubblePop
//
//  Created by Huy Cat Hoang on 4/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface BoardViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property NSTimer *timer;
@property Game *game;

@end
