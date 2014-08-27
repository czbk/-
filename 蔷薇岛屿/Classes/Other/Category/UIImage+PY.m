//
//  UIImage+PY.m
//  蔷薇岛屿
//
//  Created by panyong on 14-8-27.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import "UIImage+PY.h"

@implementation UIImage (PY)

+ (UIImage *)imageWithName:(NSString *)name
{
    if (iOS7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        
        // 利用新的文件名加载图片
        UIImage *image = [self imageNamed:newName];
        // 不存在这张图片
        if (image == nil) {
            image = [self imageNamed:name];
        }
        return image;
    } else {
        return [self imageNamed:name];
    }
}


+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [self imageWithName:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
