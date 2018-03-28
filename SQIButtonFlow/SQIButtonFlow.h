//
//  SQIButtonFlow.h
//  LingXia
//
//  Created by HSQI on 2017/11/30.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQIButtonFlow : UIView

/**
 按钮的标题数组
 */
@property(nonatomic, strong) NSArray *sqi_btnArr;

/**
 按钮的 icon 数组
 */
@property(nonatomic, strong) NSArray *sqi_iconArr;

@property(nonatomic, strong) UIColor *sqi_btnBgColor;

@property(nonatomic, strong) UIColor *sqi_btnTextColor;

@property(nonatomic, strong) UIFont *sqi_textFont;

@property (nonatomic,assign) CGFloat sqi_flowWidth;

@end
