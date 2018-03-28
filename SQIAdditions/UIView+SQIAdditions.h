//
//  UIView+SQIAdditions.h
//  LingXia
//
//  Created by 侯仕奇 on 2017/5/5.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SQIAdditions)

@property (nonatomic, assign) CGFloat sqi_x;
@property (nonatomic, assign) CGFloat sqi_y;
@property (nonatomic,assign) CGPoint sqi_center;
@property (nonatomic, assign) CGFloat sqi_centerX;
@property (nonatomic, assign) CGFloat sqi_centerY;
@property (nonatomic, assign) CGFloat sqi_width;
@property (nonatomic, assign) CGFloat sqi_height;
@property (nonatomic, assign) CGPoint sqi_origin;
@property (nonatomic, assign) CGSize sqi_size;


/**
 "我知道了"回调Block, 默认的实现为关闭弹窗
 */
@property(nonatomic, copy) void(^iKnowBlock)(void);

/**
 唯一的操作按钮的点击事件接口
 */
@property(nonatomic, copy) void(^btnBlock)(void);

@property(nonatomic, strong) NSArray <void (^)(void)>*sqi_handleBlockArr;

/**
 获取当前视图所在的直接控制器

 @return 当前视图所在的直接控制器
 */
- (UIViewController *)sqi_viewController;

@end
