//
//  NSString+SQIEmail.m
//  LingXia
//
//  Created by HSQI on 2018/3/23.
//  Copyright © 2018年 3Fsports. All rights reserved.
//

#import "NSString+SQIEmail.h"

@implementation NSString (SQIEmail)

/**
 进行邮箱正则表达式判断

 @return yes / no
 */
-(BOOL) availableEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [predicate evaluateWithObject:self];
}

@end
