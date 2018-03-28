//
//  SQIDragView.m
//  LingXia
//
//  Created by HSQI on 2017/8/31.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQIDragView.h"

@implementation SQIDragView {
    
    /// 每次拖动的初始位置
    CGPoint _originalLocation;
}

/**
 初始化方法

 @param direction 拖动方向
 @param isRestricted 拖动是否限制在父视图的范围内
 @return SQIDragView实例
 */
- (instancetype)initWithDirection:(SQIDragViewDirection)direction isRestricted:(BOOL)isRestricted
{
    self = [super init];
    if (self) {
        
        self.dragDirection = direction;
        self.isRestrictedWithinParentBounds = YES;
        [self necessaryInit];
        [self setupUI];
    }
    return self;
}

#pragma mark - Init

- (void)necessaryInit {
    
    UIPanGestureRecognizer *panGr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    self.gestureRecognizers = @[panGr];
}

#pragma mark - Gesture

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // Remember original location
    _originalLocation = self.center;
}

- (void)panAction:(UIPanGestureRecognizer *)panGr {
    
    CGPoint translation = [panGr translationInView:self.superview];
    
    
    
    
    if (_isRestrictedWithinParentBounds) {
        
        switch (self.dragDirection) {
            case SQIDragViewDirectionNormal: {
                
                CGPoint newCenter = CGPointMake(
                     _originalLocation.x + translation.x,
                     _originalLocation.y + translation.y);
                
                // Restrict movement within the parent bounds
                float half_x = CGRectGetMidX(self.bounds);
                newCenter.x = MAX(half_x, newCenter.x);
                newCenter.x = MIN(self.superview.bounds.size.width - half_x, newCenter.x);
                float half_y = CGRectGetMidY(self.bounds);
                newCenter.y = MAX(half_y, newCenter.y);
                newCenter.y = MIN(self.superview.bounds.size.height - half_y, newCenter.y);
                
                // Set new location
                self.center = newCenter;
            }
                
                break;
                
            case SQIDragViewDirectionHorizontal: {
                
                CGPoint newCenter = CGPointMake(
                                                _originalLocation.x + translation.x,
                                                _originalLocation.y);
                
                // Restrict movement within the parent bounds
                float half_x = CGRectGetMidX(self.bounds);
                newCenter.x = MAX(half_x, newCenter.x);
                newCenter.x = MIN(self.superview.bounds.size.width - half_x, newCenter.x);
                
                // Set new location
                self.center = newCenter;
            }
                break;
                
            case SQIDragViewDirectionVertical: {
                
                CGPoint newCenter = CGPointMake(
                                                _originalLocation.x,
                                                _originalLocation.y + translation.y);
                
                // Restrict movement within the parent bounds
                float half_y = CGRectGetMidY(self.bounds);
                newCenter.y = MAX(half_y, newCenter.y);
                newCenter.y = MIN(self.superview.bounds.size.height - half_y, newCenter.y);
                
                // Set new location
                self.center = newCenter;
            }
                break;
        }
    } else {
        
        switch (self.dragDirection) {
            case SQIDragViewDirectionNormal:
                self.center = CGPointMake(_originalLocation.x + translation.x, _originalLocation.y + translation.y);
                break;
                
            case SQIDragViewDirectionHorizontal:
                self.center = CGPointMake(_originalLocation.x + translation.x, _originalLocation.y);
                break;
                
            case SQIDragViewDirectionVertical:
                self.center = CGPointMake(_originalLocation.x, _originalLocation.y + translation.y);
                break;
        }
    }
}

#pragma mark - UI

- (void)setupUI {
    
}

@end
