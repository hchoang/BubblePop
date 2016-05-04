//
//  Game.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "Game.h"

@implementation Game
@synthesize bubbleArray = _bubbleArray;

-(NSMutableArray *)bubbleArray
{
    if (!_bubbleArray) _bubbleArray = [[NSMutableArray alloc] initWithCapacity:15];
    return _bubbleArray;
}

-(void)fillBubbleArray
{
    for (int i = 0; i < 15; i++) {
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
        
        CGRect rect = [self populateRandomPosition];
        [b setFrame:rect];
        for (Bubble *bubble in [self bubbleArray]) {
            if (![b isEqual:bubble]) {
                while ([b isCollied:bubble]) {
                    rect = [self populateRandomPosition];
                    [b setFrame:rect];
                }
            }
        }
        
        [[self bubbleArray] addObject:b];
    }
}

-(CGRect)populateRandomPosition
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGFloat xTemp = (CGFloat) arc4random_uniform(screenWidth - 100);
    CGFloat yTemp = (CGFloat) arc4random_uniform(screenHeight - 100);
    return CGRectMake(xTemp, yTemp, 100, 100);
}


@end
