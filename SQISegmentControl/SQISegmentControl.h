//
//  SQISegmentControl.h
//  LingXia
//
//  Created by HSQI on 2017/12/5.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQISegmentControl : UIControl

- (instancetype _Nullable)initWithItems:(nullable NSArray *)items;

@property (nonatomic,assign) NSInteger selectedSegmentIndex;

@end
