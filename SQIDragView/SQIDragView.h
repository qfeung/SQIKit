//
//  SQIDragView.h
//  LingXia
//
//  Created by HSQI on 2017/8/31.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 可供拖曳的视图的可拖曳方向

 - SQIDragViewDirectionNormal: 无限制
 - SQIDragViewDirectionHorizontal: 水平拖曳
 - SQIDragViewDirectionVertical: 垂直拖曳
 */
typedef NS_ENUM(NSUInteger, SQIDragViewDirection) {
    SQIDragViewDirectionNormal,
    SQIDragViewDirectionHorizontal,
    SQIDragViewDirectionVertical,
};

@interface SQIDragView : UIView

/**
 允许拖曳的方向
 */
@property (nonatomic,assign) SQIDragViewDirection dragDirection;

/**
 拖动是否限制在父视图的框架之内
 */
@property (nonatomic,assign) BOOL isRestrictedWithinParentBounds;

- (instancetype)initWithDirection:(SQIDragViewDirection)direction isRestricted:(BOOL)isRestricted;

- (void)setupUI;

@end
