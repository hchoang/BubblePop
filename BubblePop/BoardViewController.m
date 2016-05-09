//
//  BoardViewController.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 4/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "BoardViewController.h"

@implementation BoardViewController

int seconds;
int secondsLeft;

- (void)viewDidLoad
{
    [super viewDidLoad];
    secondsLeft = 60;
    self.game = [[Game alloc] init];
    [self.game updateBubbleArray];
    
    for (Bubble *b in [self.game bubbleArray]) {
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                              initWithTarget:self action:@selector(handleSingleTap:)];
        singleTapGestureRecognizer.numberOfTapsRequired = 1;
        [b addGestureRecognizer:singleTapGestureRecognizer];
        [self.view addSubview:b];
    }

    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateView
{
    [self.game updateBubbleArray];
    
    NSArray *bubbleViews = [self.view subviews];
    for (UIView *bubble in bubbleViews)
    {
        if (bubble.tag == 11 && ![self.game.bubbleArray containsObject:bubble])
        {
            [bubble removeFromSuperview];
        }
    }
    
    for (Bubble *b in [self.game bubbleArray]) {
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                              initWithTarget:self action:@selector(handleSingleTap:)];
        singleTapGestureRecognizer.numberOfTapsRequired = 1;
        [b addGestureRecognizer:singleTapGestureRecognizer];

        [self.view addSubview:b];
    }
    
    
    if(secondsLeft > 0 ) {
        secondsLeft-- ;
        self.timerLabel.text = [NSString stringWithFormat:@"%02d", secondsLeft];
    } else {
        [self.timer invalidate];
    }
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    Bubble *bubble = (Bubble *) recognizer.view;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [bubble setAlpha:0.0];
    [UIView commitAnimations];
    self.game.player.point += bubble.point;
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", self.game.player.point];
}

@end
