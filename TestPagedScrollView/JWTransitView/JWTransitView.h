//
//  JWTransitView.h
//  TestPagedScrollView
//
//  Created by Wang Jowyer on 13-8-13.
//  Copyright (c) 2013年 jo2Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWTransitView : UIView
{
    UIView *leftMaskView;
    UIView *rightMaskView;
}

@property (nonatomic, assign) UIScrollView* childScrollView;

-(void)showMaskViewWithMiddleWidth:(float)middleWidth;

@end
