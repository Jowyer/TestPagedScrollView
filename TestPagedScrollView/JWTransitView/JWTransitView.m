//
//  JWTransitView.m
//  TestPagedScrollView
//
//  Created by Wang Jowyer on 13-8-13.
//  Copyright (c) 2013年 jo2Studio. All rights reserved.
//

#import "JWTransitView.h"

@implementation JWTransitView
@synthesize childScrollView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}

- (void)dealloc
{
    self.childScrollView = nil;
    [super dealloc];
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.childScrollView)
    {
        if ([self pointInside:point withEvent:event])
        {
            return self.childScrollView;
        }
        return nil;
    }
    return nil;
}

@end
