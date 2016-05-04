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
    self.alpha = 0.5;
    [self layer].cornerRadius = 50;
    return self;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"the bubble has been touched\n");
    NSLog(@"the color of the bubble is %@", self.backgroundColor.description);
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

