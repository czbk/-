//
//  TabBarView.h
//  蔷薇岛屿
//
//  Created by panyong on 14-8-27.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabBarView;

@protocol TabBarViewDelegate <NSObject>

@optional
/**
 *  TabBar上面的按钮被选中了
 *
 *  @param tabBar 被点击的IWTabBar
 *  @param from   原来按钮的位置
 *  @param to     新选中按钮的位置
 */
- (void)tabBarView:(TabBarView *)tabBar didSelectButtonFrom:(int)from to:(int)to;

@end


@interface TabBarView : UIView

/**
 *  通过一个item对象来添加一个按钮TabBarButton
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic,weak) id<TabBarViewDelegate> delegate;

@end
