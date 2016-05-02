//
//  Game.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "Game.h"

@implementation Game

-(void)fillBubbleArray
{
    for (int i = 0; i < 20; i++) {
        Bubble *b = [[Bubble alloc] init];
        printf("x: %f - y: %f\n", [b frame].origin.x, [b frame].origin.y);
        [_bubbleArray addObject:b];
    }
    self.bubbleArray = _bubbleArray;
}

@end
