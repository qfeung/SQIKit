//
//  UIImage+SQIAdditions.h
//  LingXia
//
//  Created by HSQI on 2018/1/19.
//  Copyright © 2018年 3Fsports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SQIAdditions)

/**
 *  返回一张可以随意拉伸不变形的图片
 *  @param imageName 图片名字
 */
+(UIImage *)stretchImageWithImage:(NSString *)imageName;

@end
