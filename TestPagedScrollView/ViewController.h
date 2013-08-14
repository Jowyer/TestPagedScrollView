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
    int seenItemNum;
    int itemCount;
    float itemWidth;
    float itemHeight;
    
    float itemGap;
    int scrollViewWidth;
    float scrollMarginX;
    float scrollMarginY;
    float itemMarginX;
    float itemMarginY;
    
    JWTransitView *containerView;
    UIScrollView *myScrollView;
}

@end
