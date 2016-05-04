//
//  ViewController.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Game *game = [[Game alloc] init];
    [game fillBubbleArray];
    
    NSMutableArray *bubbles = [game bubbleArray];
    for (Bubble *b in bubbles) {
        [self.view addSubview:b];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
