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
    self.layer.cornerRadius = 50;
    self.tag = 11;
    return self;
}


-(Boolean)isCollied:(Bubble *)bubble
{
    if (CGRectIntersectsRect([self frame], [bubble frame])) {
        return TRUE;
    } else {
        return FALSE;
    }
}

@end

