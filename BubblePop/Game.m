//
//  Game.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "Game.h"

@implementation Game

-(id)init
{
    self = [super init];
    self.bubbleArray = [[NSMutableArray alloc] init];
    return self;
}

-(void)fillBubbleArray
{
    for (int i = 0; i < 20; i++) {
        Bubble *b = [[Bubble alloc] init];
        int probability = arc4random() % 100;
        if (probability < 40) {
            [b setBackgroundColor:[UIColor redColor]];
        } else if (probability < 70) {
            [b setBackgroundColor:[UIColor purpleColor]];
        } else if (probability < 85) {
            [b setBackgroundColor:[UIColor greenColor]];
        } else if (probability < 95) {
            [b setBackgroundColor:[UIColor blueColor]];
        } else {
            [b setBackgroundColor:[UIColor blackColor]];
        }
        
        [self.bubbleArray addObject:b];
    }
}

@end
