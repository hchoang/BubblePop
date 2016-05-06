//
//  BoardViewController.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 4/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "BoardViewController.h"

@implementation BoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.game = [[Game alloc] init];
    self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(addBubble) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addBubble
{
    [self.game fillBubbleArray];
    for (Bubble *b in [self.game bubbleArray]) {
        [self.view addSubview:b];
    }
}

@end
