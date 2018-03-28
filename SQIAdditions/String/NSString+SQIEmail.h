//
//  NSString+SQIEmail.h
//  LingXia
//
//  Created by HSQI on 2018/3/23.
//  Copyright © 2018年 3Fsports. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SQIEmail)

/**
 进行邮箱正则表达式判断
 
 @return yes / no
 */
-(BOOL) availableEmail;

@end
