//
//  SQITapView.m
//  LingXia
//
//  Created by 侯仕奇 on 2017/8/22.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQITapView.h"

@implementation SQITapView

#pragma mark - Gesture

- (void)setupGesture {
    [super setupGesture];
    
    SQITapGr *gr = [[SQITapGr alloc] initWithTarget:self action:@selector(sqi_tapClick)];
    [self addGestureRecognizer:gr];
}

- (void)sqi_tapClick {
    
    if (_sqi_tapBlock) {
        _sqi_tapBlock();
    }
}

@end
