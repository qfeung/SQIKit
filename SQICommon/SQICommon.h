//
//  SQICommon.h
//  LingXia
//
//  Created by HSQI on 2017/10/26.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {\
            view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
            } else if([controller isKindOfClass:[UIViewController class]]){\
            controller.automaticallyAdjustsScrollViewInsets = false;\
            }

@interface SQICommon : NSObject

/**
 应用的keyWindow动态切换根视图控制器

 @param newRootVc 新的根视图控制器
 @param options 切换的动画样式
 @param duration 动画时长
 @param completionBlock 动画完成之后的回调Block
 */
+ (void)sqi_switchKeyWindowRootVcTo:(UIViewController * _Nonnull)newRootVc transitionOptions:(UIViewAnimationOptions)options duration:(NSTimeInterval)duration completion:(void (^ __nullable)(void))completionBlock;

#pragma mark - Json解析精度丢失处理NSString, Double, Float

+ (NSString * _Nonnull)decimalNumberWithDouble:(double)conversionValue;

#pragma mark - 由View生成Image

+ (UIImage *_Nonnull)makeImageWithView:(UIView *_Nonnull)view;

@end
