//
//  Game.h
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "constant.h"
#import "Bubble.h"
#import "Player.h"

@interface Game : NSObject

@property (strong, nonatomic) NSMutableArray *bubbleArray;
@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) NSMutableArray * clickedBubbles;
@property (strong, nonatomic) NSMutableArray * highScore;
@property int maxBubble;

- (NSArray *)updateBubbleArray;
-(Bubble *)generateBubble;
- (int) calculateScore: (Bubble *)bubble;
- (void) saveScore;
@end
