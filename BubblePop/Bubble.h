//
//  Bobble.h
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
#import "constant.h"

@interface Bubble : UIView

@property UIColor *color;
@property int score;
@property CGRect rect;

-(Boolean)isCollied:(Bubble *)bubble;

@end
