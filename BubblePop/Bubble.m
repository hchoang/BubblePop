//
//  Bobble.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "Bubble.h"

@implementation Bubble

@synthesize x = _x;
@synthesize y = _y;
@synthesize width = _width;
@synthesize height = _height;

-(id)init
{
    self = [super init];
    self.alpha = 0.5;
    [self layer].cornerRadius = 50;
    return self;
}

- (CGRect)populatePosition
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
}
@end
