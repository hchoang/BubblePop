//
//  Game.h
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bubble.h"

@interface Game : NSObject

@property NSMutableArray *bubbleArray;

- (void)fillBubbleArray;

@end
