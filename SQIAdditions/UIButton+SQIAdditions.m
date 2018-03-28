//
//  UIButton+SQIAdditions.m
//  LingXia
//
//  Created by HSQI on 2017/11/9.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "UIButton+SQIAdditions.h"

@implementation UIButton (SQIAdditions)

+ (instancetype)sqi_buttonForNormalStateWithFont:(UIFont *)font titleColor:(UIColor *)titleColor title:(NSString *)title {
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn sizeToFit];// sizeToFit到底有什么作用?
    return btn;
}

@end
