//
//  ViewController.m
//  TestPagedScrollView
//
//  Created by Wang Jowyer on 13-8-13.
//  Copyright (c) 2013年 jo2Studio. All rights reserved.
//

#define JWColorWithRGBA(R, G, B, A) [UIColor colorWithRed : (R)/255.0 green : (G)/255.0 blue : (B)/255.0 alpha : A]

#import "ViewController.h"

@implementation ViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        itemHeight = itemWidth = 60;
        itemGap = 46;
        itemCount = 4;
        scrollMarginX = 23;
        scrollMarginY = 10;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    containerView = [[JWTransitView alloc] initWithFrame:CGRectMake(0, 40, 320, 80)];
    containerView.backgroundColor = [UIColor clearColor];
//    containerView.backgroundColor = JWColorWithRGBA(33, 33, 33, 0.7);
    
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(107, 0, itemWidth + itemGap, 80)];
    myScrollView.contentSize = CGSizeMake(itemCount * (itemWidth + itemGap), 80);
    myScrollView.pagingEnabled = YES;
    myScrollView.clipsToBounds = NO;
    myScrollView.backgroundColor = [UIColor clearColor];
//    myScrollView.backgroundColor = JWColorWithRGBA(24, 56, 235, 0.3);
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.delegate = self;
    
    containerView.childScrollView = myScrollView;
    for (int i = 0; i < itemCount; i++)
    {
        UIImageView *itemView = [[[UIImageView alloc] initWithFrame:CGRectMake(scrollMarginX + i * (itemWidth + itemGap), scrollMarginY, itemWidth, itemHeight)] autorelease];
        itemView.image = [UIImage imageNamed:[NSString stringWithFormat:@"item%d.png", i]];
        [myScrollView addSubview:itemView];
        itemView.backgroundColor = [UIColor clearColor];
        //        itemView.backgroundColor = JWColorWithRGBA(233, 233, 233, 0.5);
    }
    
    [containerView addSubview:myScrollView];
    [self.view addSubview:containerView];
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
