//
//  UILabel+SQIAdditions.h
//  LingXia
//
//  Created by 侯仕奇 on 2017/7/28.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SQIAdditions)

/**
 行间距
 */
@property (nonatomic,assign) CGFloat sqi_lineSpacing;

+ (instancetype)sqi_labelWithFont:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text;

@end
