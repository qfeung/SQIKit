//
//  SQICategoryView.h
//  云蛛网络
//
//  Created by 侯仕奇 on 2017/1/17.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQICategoryView : UIControl

/**
 *  滚动视图滚动后,传过来的让蓝条滚动的距离!
 */
@property (assign, nonatomic) CGFloat offset_x;
/**
 *  需要滚动到的页码
 */
@property (assign, nonatomic) NSInteger pageNumber;

- (instancetype)initWithTitleArr:(NSArray *)titleArr btnColor:(UIColor *)btnColor;

@end
