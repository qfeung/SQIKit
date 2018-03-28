//
//  SQIDispatch.m
//  LingXia
//
//  Created by 侯仕奇 on 2017/9/7.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQIDispatch.h"

@implementation SQIDispatch

/// 在App的生命周期内, 只有第一次不做
+ (void)sqi_dispatchOnceNo:(void (^)(void))onceNoBlock {
    
    static dispatch_once_t onceToken;
    
    if (onceToken == 0) {
        // do nothing...
    } else {
        
        if (onceNoBlock) {
            onceNoBlock();
        }
    }
    dispatch_once(&onceToken, ^{
        // do nothing...
    });
}

@end
