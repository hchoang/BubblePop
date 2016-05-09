//
//  Game.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "Game.h"

@implementation Game

-(Player *)player
{
    if (!_player) _player = [[Player alloc] init];
    return _player;
}

-(NSMutableArray *)bubbleArray
{
    if (!_bubbleArray) _bubbleArray = [[NSMutableArray alloc] initWithCapacity:15];
    return _bubbleArray;
}

-(void)updateBubbleArray
{
    if (_bubbleArray == nil || [_bubbleArray count] == 0) {
        for (int i = 0; i < 15; i++) {
            Bubble *b = [self generateBubble];
            [[self bubbleArray] addObject:b];
        }
    } else {
        NSMutableArray *popBubbles = [NSMutableArray array];
        NSMutableArray *newBubbles = [NSMutableArray array];
        for (Bubble *bubble in self.bubbleArray)
        {
            int prob = arc4random() % 15;
            if (prob < 4) {
                [popBubbles addObject:bubble];
                [newBubbles addObject:[self generateBubble]];
            }
        }
        
        [self.bubbleArray removeObjectsInArray:popBubbles];
        [self.bubbleArray addObjectsFromArray:newBubbles];
    }
    
}

//-(CGRect)populateRandomPosition
//{
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat screenWidth = screenRect.size.width;
//    CGFloat screenHeight = screenRect.size.height;
//    CGFloat xTemp = (CGFloat) arc4random_uniform(screenWidth - 100);
//    CGFloat yTemp = (CGFloat) arc4random_uniform(screenHeight - 100);
//    return CGRectMake(xTemp, yTemp, 100, 100);
//}

-(Bubble *)generateBubble
{
    Bubble *b = [[Bubble alloc] init];
    b.point = 10;
    int probability = arc4random() % 100;
    if (probability < 40) {
        [b setBackgroundColor:[UIColor redColor]];
        b.point = 1;
    } else if (probability < 70) {
        [b setBackgroundColor:[UIColor purpleColor]];
        b.point = 2;
    } else if (probability < 85) {
        [b setBackgroundColor:[UIColor greenColor]];
        b.point = 5;
    } else if (probability < 95) {
        [b setBackgroundColor:[UIColor blueColor]];
        b.point = 8;
    } else {
        [b setBackgroundColor:[UIColor blackColor]];
        b.point = 10;
    }
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGFloat xTemp = (CGFloat) arc4random_uniform(screenWidth - 100);
    CGFloat yTemp = (CGFloat) arc4random_uniform(screenHeight - 100);
    CGRect rect = CGRectMake(xTemp, yTemp, 100, 100);
    [b setFrame:rect];

    return b;
}

@end
