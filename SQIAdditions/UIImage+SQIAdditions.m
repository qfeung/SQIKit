//
//  UIImage+SQIAdditions.m
//  LingXia
//
//  Created by HSQI on 2018/1/19.
//  Copyright © 2018年 3Fsports. All rights reserved.
//

#import "UIImage+SQIAdditions.h"

@implementation UIImage (SQIAdditions)

/**
 *  返回一张可以随意拉伸不变形的图片
 *  @param imageName 图片名字
 */
+(UIImage *)stretchImageWithImage:(NSString *)imageName {
    
    UIImage *normal = [UIImage imageNamed:imageName];
    CGFloat w = normal.size.width * 0.3;
    CGFloat h = normal.size.height * 0.3;
    return [normal stretchableImageWithLeftCapWidth:w topCapHeight:h];
}

@end
