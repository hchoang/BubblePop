//
//  Game.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "Game.h"

@implementation Game

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Load highscore from saved
        _highScore = [[NSUserDefaults standardUserDefaults] objectForKey:DATA_KEY];
        if (!_highScore) {
            _highScore = [[NSMutableArray alloc] init];
        } else {
            _highScore = [[NSMutableArray alloc] initWithArray:_highScore];
        }

    }
    return self;
}

-(NSMutableArray *)clickedBubbles
{
    if (!_clickedBubbles) _clickedBubbles = [[NSMutableArray alloc] init];
    return _clickedBubbles;
}

-(Player *)player
{
    if (!_player) _player = [[Player alloc] init];
    return _player;
}

-(NSMutableArray *)bubbleArray
{
    if (!_bubbleArray) _bubbleArray = [[NSMutableArray alloc] init];
    return _bubbleArray;
}

/**
 * Remove and add new random bubble
 * Return an array of deleted bubbles
 */
-(NSArray *)updateBubbleArray
{
    if (_bubbleArray == nil || [_bubbleArray count] == 0) {
        for (int i = 0; i < self.maxBubble; i++) {
            Bubble *b = [self generateBubble];
            while (!b) {
                b = [self generateBubble];
            }
            [[self bubbleArray] addObject:b];
        }
        return nil;
    } else {
        NSMutableArray *popBubbles = [NSMutableArray array];
        for (Bubble *bubble in self.bubbleArray)
        {
            int prob = arc4random() % self.maxBubble;
            if (prob < self.maxBubble * 2 / 3) {
                [popBubbles addObject:bubble];
            }
        }
        
        [self.bubbleArray removeObjectsInArray:popBubbles];
        
        for (int i = 0; i < [popBubbles count] ; i++) {
            Bubble * b = [self generateBubble];
            while (!b) {
                b = [self generateBubble];
            }
            [self.bubbleArray addObject:b];
        }
        return popBubbles;
    }
    
}


-(Bubble *)generateBubble
{
    Bubble *b = [[Bubble alloc] init];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGFloat xTemp = (CGFloat) arc4random_uniform(screenWidth - BUBBLE_SIZE);
    CGFloat yTemp = (CGFloat) arc4random_uniform(screenHeight - BUBBLE_SIZE);
    CGRect rect = CGRectMake(xTemp, yTemp, BUBBLE_SIZE, BUBBLE_SIZE);
    [b setFrame:rect];
    
    for (Bubble * bubble in self.bubbleArray) {
        if ([b isCollied:bubble]) {
            return nil;
        }
    }
    
    int probability = arc4random() % 100;
    if (probability < 40) {
        [b setBackgroundColor:[UIColor redColor]];
        b.score = RED_BUBBLE_POINT;
    } else if (probability < 70) {
        [b setBackgroundColor:[UIColor purpleColor]];
        b.score = PINK_BUBBLE_POINT;
    } else if (probability < 85) {
        [b setBackgroundColor:[UIColor greenColor]];
        b.score = GREEN_BUBBLE_POINT;
    } else if (probability < 95) {
        [b setBackgroundColor:[UIColor blueColor]];
        b.score = BLUE_BUBBLE_POINT;
    } else {
        [b setBackgroundColor:[UIColor blackColor]];
        b.score = BLACK_BUBBLE_POINT;
    }

    return b;
}

-(int) calculateScore:(Bubble *)bubble
{
    if (self.clickedBubbles == nil || [self.clickedBubbles count] == 0) {
        [self.clickedBubbles addObject:bubble];
        return bubble.score;
    } else {
        int arrayLength = (int) [self.clickedBubbles count];
        Bubble * previous = [self.clickedBubbles objectAtIndex:(arrayLength - 1)];
        [self.clickedBubbles addObject:bubble];
        if (CGColorEqualToColor(bubble.backgroundColor.CGColor, previous.backgroundColor.CGColor)) {
            return bubble.score * 1.5;
        } else {
            return bubble.score;
        }

    }
}

-(void)saveScore
{
    NSDictionary * score = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    self.player.name, DICTIONARY_NAME_KEY,
                                    [NSNumber numberWithInt:self.player.score], DICTIONARY_SCORE_KEY, nil];
    [self.highScore addObject:score];
    
    NSSortDescriptor * brandDescriptor = [[NSSortDescriptor alloc] initWithKey:DICTIONARY_SCORE_KEY ascending:NO];
    NSArray * sortDescriptors = [NSArray arrayWithObject:brandDescriptor];
    self.highScore = [[self.highScore sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:self.highScore forKey:DATA_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
