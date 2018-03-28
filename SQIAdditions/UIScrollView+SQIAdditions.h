//
//  UIScrollView+SQIAdditions.h
//  LingXia
//
//  Created by HSQI on 2017/10/18.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (SQIAdditions)

@property(nonatomic, copy) void (^sqi_scrBlock)(void);

@property(nonatomic, copy) void (^sqi_willBeginDraggingBlock)(void);

@property(nonatomic, copy) void (^sqi_didEndDraggingBlock)(void);

@end
