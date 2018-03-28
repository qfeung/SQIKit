//
//  UIView+SQIAdditions.m
//  LingXia
//
//  Created by 侯仕奇 on 2017/5/5.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "UIView+SQIAdditions.h"

@implementation UIView (SQIAdditions)

static char *IKnowBlockKey = "IKnowBlockKey";
static char *BtnBlockKey = "BtnBlockKey";
static char *HandleBlockArrKey = "HandleBlockArrKey";

#pragma mark - i know block

- (void)setIKnowBlock:(void (^)(void))iKnowBlock {
    /*
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     */
    
    objc_setAssociatedObject(self, IKnowBlockKey, iKnowBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))iKnowBlock {
    return objc_getAssociatedObject(self, IKnowBlockKey);
}

#pragma mark - Btn Block

- (void)setBtnBlock:(void (^)(void))btnBlock {
    objc_setAssociatedObject(self, BtnBlockKey, btnBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))btnBlock {
    return objc_getAssociatedObject(self, BtnBlockKey);
}

#pragma mark - handle block array

- (void)setSqi_handleBlockArr:(NSArray<void (^)(void)> *)handleBlockArr {
    objc_setAssociatedObject(self, HandleBlockArrKey, handleBlockArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray<void (^)(void)> *)sqi_handleBlockArr {
    return objc_getAssociatedObject(self, HandleBlockArrKey);
}

#pragma mark - UIViewController

/// 获取当前视图的首个控制器
- (UIViewController *)sqi_viewController {
    
    for (UIView * next = [self superview]; next; next = next.superview) {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - Frame

- (void)setSqi_x:(CGFloat)sqi_x
{
    CGRect frame = self.frame;
    frame.origin.x = sqi_x;
    self.frame = frame;
}

- (CGFloat)sqi_x
{
    return self.frame.origin.x;
}

- (void)setSqi_y:(CGFloat)sqi_y
{
    CGRect frame = self.frame;
    frame.origin.y = sqi_y;
    self.frame = frame;
}


- (CGFloat)sqi_y
{
    return self.frame.origin.y;
}

- (void)setSqi_center:(CGPoint)sqi_center {
    
    self.sqi_x = sqi_center.x - self.sqi_width / 2;
    self.sqi_y = sqi_center.y - self.sqi_height / 2;
}

- (CGPoint)sqi_center {
    
    return CGPointMake(self.sqi_x + self.sqi_width / 2, self.sqi_y + self.sqi_height / 2);
}

- (void)setSqi_centerX:(CGFloat)sqi_centerX
{
    CGPoint center = self.center;
    center.x = sqi_centerX;
    self.center = center;
}

- (CGFloat)sqi_centerX
{
    return self.center.x;
}

- (void)setSqi_centerY:(CGFloat)sqi_centerY
{
    CGPoint center = self.center;
    center.y = sqi_centerY;
    self.center = center;
}

- (CGFloat)sqi_centerY
{
    return self.center.y;
}

- (void)setSqi_width:(CGFloat)sqi_width
{
    CGRect frame = self.frame;
    frame.size.width = sqi_width;
    self.frame = frame;
}

- (void)setSqi_height:(CGFloat)sqi_height
{
    CGRect frame = self.frame;
    frame.size.height = sqi_height;
    self.frame = frame;
}

- (CGFloat)sqi_height
{
    return self.frame.size.height;
}

- (CGFloat)sqi_width
{
    return self.frame.size.width;
}

- (void)setSqi_origin:(CGPoint)sqi_origin
{
    CGRect frame = self.frame;
    frame.origin = sqi_origin;
    self.frame = frame;
}

- (CGPoint)sqi_origin
{
    return self.frame.origin;
}


- (void)setSqi_size:(CGSize)sqi_size {
    CGRect frame = self.frame;
    frame.size = sqi_size;
    self.frame = frame;
}

- (CGSize)sqi_size {
    return self.frame.size;
}

@end
