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
    if (leftMaskView)
    {
        [leftMaskView release]; leftMaskView = nil;
        [rightMaskView release]; rightMaskView = nil;
    }
    [super dealloc];
}

-(void)showMaskViewWithMiddleWidth:(float)middleWidth
{
    if (leftMaskView)
    {
        return;
    }
    float maskWidth = (kScreenWidth - middleWidth) / 2;
    
    leftMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, maskWidth, CGRectGetHeight(self.frame))];
    [self addSubview:leftMaskView];
    
    rightMaskView = [[UIView alloc] initWithFrame:CGRectMake(maskWidth + middleWidth, 0, maskWidth, CGRectGetHeight(self.frame))];
    [self addSubview:rightMaskView];
    
    leftMaskView.backgroundColor = rightMaskView.backgroundColor = JWColorWithRGBA(33, 33, 33, 0.5);
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
