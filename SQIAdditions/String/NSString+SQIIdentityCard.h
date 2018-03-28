//
//  NSString+SQIIdentityCard.h
//  LingXia
//
//  Created by HSQI on 2018/3/16.
//  Copyright © 2018年 3Fsports. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SQIIdentityCard)

/**
 获取身份证号对应的年龄

 @return 年龄
 */
- (NSUInteger)sqi_getIdentityCardAge;

@end
