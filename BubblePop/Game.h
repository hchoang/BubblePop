//
//  Game.h
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bubble.h"
#import "Player.h"

@interface Game : NSObject

@property (strong, nonatomic) NSMutableArray *bubbleArray;
@property (strong, nonatomic) Player *player;

- (void)updateBubbleArray;
//- (CGRect)populateRandomPosition;
-(Bubble *)generateBubble;

@end
