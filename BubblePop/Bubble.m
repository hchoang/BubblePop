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
    CGRect rect = [self populatePosition];
    self.frame = rect;
    return self;
}

- (CGRect)populatePosition
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGFloat xTemp = (CGFloat) arc4random_uniform(screenWidth - 100);
    CGFloat yTemp = (CGFloat) arc4random_uniform(screenHeight - 100);
    return CGRectMake(xTemp, yTemp, 100, 100);
}
@end
