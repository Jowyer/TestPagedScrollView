//
//  ViewController.h
//  TestPagedScrollView
//
//  Created by Wang Jowyer on 13-8-13.
//  Copyright (c) 2013年 jo2Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWTransitView.h"

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    float itemWidth;
    float itemHeight;
    float itemGap;
    float itemCount;
    float scrollMarginX;
    float scrollMarginY;
    
    JWTransitView *containerView;
    UIScrollView *myScrollView;
}

@end
