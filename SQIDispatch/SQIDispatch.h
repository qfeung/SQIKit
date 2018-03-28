//
//  SQIDispatch.h
//  LingXia
//
//  Created by 侯仕奇 on 2017/9/7.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQIDispatch : NSObject

/// 在App的生命周期内, 只有第一次不做
+ (void)sqi_dispatchOnceNo:(void (^)(void))onceNoBlock;

@end
