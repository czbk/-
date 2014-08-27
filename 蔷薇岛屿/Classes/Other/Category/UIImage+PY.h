//
//  UIImage+PY.h
//  蔷薇岛屿
//
//  Created by panyong on 14-8-27.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PY)

/**
 *  适配ios5，ios6的图片，其实这个基本没有用，因为大多数机器都是4代机器
 *
 *  @param name 图片名称
 *
 *  @return 图片
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  放大图片，不变形
 *
 *  @param name 图片名称
 *
 *  @return 放大但不变形的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
@end
