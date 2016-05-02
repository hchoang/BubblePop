//
//  Game.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "Game.h"

@implementation Game

-(NSArray *)fillBubbleArray
{
    
    return _bubbles;
}

-(Bubble *)generateBubble
{
    Bubble *bubble = [[Bubble alloc] init];

    
    return bubble;
}

-(CGRect)generateLocation
{
    return CGRectMake(10, 10, 100, 100);
}

@end
