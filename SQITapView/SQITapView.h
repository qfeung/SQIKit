//
//  SQITapView.h
//  LingXia
//
//  Created by 侯仕奇 on 2017/8/22.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQIBaseView.h"

@interface SQITapView : SQIBaseView

@property(nonatomic, copy) void (^sqi_tapBlock)(void);

@end
