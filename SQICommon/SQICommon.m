//
//  SQICommon.m
//  LingXia
//
//  Created by HSQI on 2017/10/26.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQICommon.h"

@implementation SQICommon

+ (void)sqi_switchKeyWindowRootVcTo:(UIViewController *)newRootVc transitionOptions:(UIViewAnimationOptions)options duration:(NSTimeInterval)duration completion:(void (^ __nullable)(void))completionBlock {
    NSParameterAssert(newRootVc);
    [UIView transitionFromView:kKeyWindow.rootViewController.view
                        toView:newRootVc.view
                      duration:duration
                       options:options
                    completion:^(BOOL finished)
     {
         kKeyWindow.rootViewController = newRootVc;
         if (completionBlock) {
             completionBlock();
         }
     }];
}

#pragma mark - Json解析精度丢失处理NSString, Double, Float

/** 直接传入精度丢失有问题的Double类型*/
+ (NSString *)decimalNumberWithDouble:(double)conversionValue {
    NSString *doubleString        = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

#pragma mark - 由View生成Image

+ (UIImage *)makeImageWithView:(UIView *)view {
    

    UIImage *image = nil;
    if ([view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)view;
        UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, NO, [UIScreen mainScreen].scale);

        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        [scrollView.layer renderInContext:UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
        UIGraphicsEndImageContext();

        return image;
    } else {
        CGSize contentSize = view.bounds.size;
        // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数。
        
        UIGraphicsBeginImageContextWithOptions(contentSize, NO, [UIScreen mainScreen].scale);
        
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return image;
    }
}

@end
