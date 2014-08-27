//
//  TabBarView.m
//  蔷薇岛屿
//
//  Created by panyong on 14-8-27.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import "TabBarView.h"
#import "TabBarButton.h"


@interface TabBarView ()
{
    int _tabBarButtonCount;
    TabBarButton *_selectedTabBarButton;
}

@end

@implementation TabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        
    }
    return self;
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 0.最多添加4个
    if (_tabBarButtonCount >= 4) return;
    
    // 1.创建按钮
    TabBarButton *btn = [[TabBarButton alloc] init];
    
    // 2.设置frame
    CGFloat btnH = self.frame.size.height;
    CGFloat btnW = self.frame.size.width / 4;
    CGFloat btnX = btnW * _tabBarButtonCount;
    btn.frame = CGRectMake(btnX, 0, btnW, btnH);
    
    // 3.设置图片和文字
    btn.item = item;
    
    // 4.监听点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    // 5.默认让第0个按钮选中
    btn.tag = _tabBarButtonCount;
    if (_tabBarButtonCount == 0) {
        [self btnClick:btn];
    }
    
    [self addSubview:btn];
    
    _tabBarButtonCount++;
}

/**
 *  监听IWTabBarButton点击
 *
 *  @param btn 被点击的tabbarButton
 */
-(void)btnClick:(TabBarButton *)btn
{
    //通知代理方法
    if ([_delegate respondsToSelector:@selector(tabBarView:didSelectButtonFrom:to:)]) {
        [_delegate tabBarView:self didSelectButtonFrom:_selectedTabBarButton.tag to:btn.tag];
    }
    //改变选中按钮
    _selectedTabBarButton.selected = NO;
    btn.selected = YES;
    _selectedTabBarButton = btn;
}


@end
