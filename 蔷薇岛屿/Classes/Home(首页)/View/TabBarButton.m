//
//  TabBarButton.m
//  蔷薇岛屿
//
//  Created by panyong on 14-8-27.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import "TabBarButton.h"

@interface TabBarButton ()
{
    UIButton *_badgeValueBtn;
}

@end

@implementation TabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        // 2.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        if (iOS7) {
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        
        // 3.设置选中时的背景图片
        [self setBackgroundImage:[UIImage resizedImage:@"tabbar_slider"] forState:UIControlStateSelected];
        
        // 4.添加一个显示红色提醒数字的按钮
        _badgeValueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_badgeValueBtn setBackgroundImage:[UIImage resizedImage:@"main_badge"] forState:UIControlStateNormal];
        _badgeValueBtn.userInteractionEnabled = NO;
        _badgeValueBtn.hidden = YES;
        _badgeValueBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_badgeValueBtn];
    }
    return self;

}

/**
 *  目的是去掉父类在高亮时所做的操作
 */
- (void)setHighlighted:(BOOL)highlighted {}

#pragma mark - 覆盖父类的2个方法
#pragma mark 设置按钮标题的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    UIImage *image =  [self imageForState:UIControlStateNormal];
    CGFloat titleY = image.size.height;
    CGFloat titleHeight = self.bounds.size.height - titleY;
    return CGRectMake(0, titleY, self.bounds.size.width,  titleHeight);
}
#pragma mark 设置按钮图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    UIImage *image = [self imageForState:UIControlStateNormal];
    return CGRectMake(0, 0, contentRect.size.width, image.size.height + 5);
}


-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    // 1.利用KVO监听item属性值的改变
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    
    // 2.属性赋值
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}


/**
 *  监听item的属性值改变
 *
 *  @param keyPath 哪个属性改变了
 *  @param object  哪个对象的属性改变了
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //    IWLog(@"------%@的%@改变了", object, keyPath);
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    // 设置提醒数字
    if ([_item.badgeValue intValue] > 0) { // 显示
        _badgeValueBtn.hidden = NO;
        
        [_badgeValueBtn setTitle:_item.badgeValue forState:UIControlStateNormal];
        
        // 设置按钮的尺寸
        CGSize textSize = [_item.badgeValue sizeWithFont:_badgeValueBtn.titleLabel.font];
        CGFloat btnW = textSize.width + 12;
        CGFloat btnX = self.frame.size.width - btnW - 5;
        CGFloat btnH = textSize.height + 5;
        CGFloat btnY = 2;
        _badgeValueBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    } else { // 隐藏
        _badgeValueBtn.hidden = YES;
    }
}




@end
