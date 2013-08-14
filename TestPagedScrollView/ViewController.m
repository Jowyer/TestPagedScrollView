//
//  ViewController.m
//  TestPagedScrollView
//
//  Created by Wang Jowyer on 13-8-13.
//  Copyright (c) 2013年 jo2Studio. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        seenItemNum = 3;
        itemCount = 4;
        itemWidth = 60;
        itemHeight = 60;
        
        itemGap = (kScreenWidth - itemWidth * seenItemNum) / seenItemNum;
        scrollViewWidth = itemWidth + itemGap;
        scrollMarginX = (kScreenWidth - scrollViewWidth) / 2;
        scrollMarginY = 0;
        itemMarginX = (scrollViewWidth - itemWidth) / 2;
        itemMarginY = 10;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    containerView = [[JWTransitView alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, itemHeight + itemMarginY * 2)];
    [self.view addSubview:containerView];
//    containerView.backgroundColor = JWColorWithRGBA(33, 33, 33, 0.7);
    
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(scrollMarginX, scrollMarginY, scrollViewWidth, itemHeight + itemMarginY * 2)];
    myScrollView.contentSize = CGSizeMake(itemCount * (itemWidth + itemGap), itemHeight + itemMarginY * 2);
    myScrollView.pagingEnabled = YES;
    myScrollView.clipsToBounds = NO;
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.delegate = self;
    
    containerView.childScrollView = myScrollView;
    [containerView addSubview:myScrollView];
    [containerView showMaskViewWithMiddleWidth:scrollViewWidth];
//    myScrollView.backgroundColor = JWColorWithRGBA(24, 56, 235, 0.3);
    
    for (int i = 0; i < itemCount; i++)
    {
        UIImageView *itemView = [[[UIImageView alloc] initWithFrame:CGRectMake(itemMarginX + i * scrollViewWidth, itemMarginY, itemWidth, itemHeight)] autorelease];
        itemView.image = [UIImage imageNamed:[NSString stringWithFormat:@"item%d.png", i]];
        [myScrollView addSubview:itemView];
//        itemView.backgroundColor = JWColorWithRGBA(233, 233, 233, 0.5);
    }
}

- (void)dealloc
{
    [containerView release]; containerView = nil;
    [myScrollView release]; myScrollView = nil;
    [super dealloc];
}

#pragma mark- ScrollView Delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == myScrollView)
    {
        int page = myScrollView.contentOffset.x / CGRectGetWidth(myScrollView.frame);
        NSLog(@"now the page is %d", page);
    }
}

@end
