//
//  Bobble.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "Bubble.h"

@implementation Bubble

-(id)init
{
    self = [super init];
    self.layer.cornerRadius = BUBBLE_CORNER_RADIUS;
    self.tag = BUBBLE_TAG;
    self.alpha = MAXIMUM_ALPHA;
    return self;
}

/**
 * check if 2 bubbles is collied with each other
 */
-(Boolean)isCollied:(Bubble *)bubble
{
    if (self.frame.origin.x + BUBBLE_SIZE > bubble.frame.origin.x
        && self.frame.origin.x - BUBBLE_SIZE < bubble.frame.origin.x) {
        if (self.frame.origin.y + BUBBLE_SIZE > bubble.frame.origin.y
            && self.frame.origin.y - BUBBLE_SIZE < bubble.frame.origin.y) {
            return YES;
        }
    }
    return NO;
}

@end

