//
//  ViewController.h
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *startGameButton;
@property (weak, nonatomic) IBOutlet UIStepper *maxBubbleStepperView;
@property (weak, nonatomic) IBOutlet UILabel *maxBubbleLabel;

@property (strong, nonatomic) Game * game;


@end

