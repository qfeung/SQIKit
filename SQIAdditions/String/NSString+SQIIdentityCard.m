//
//  NSString+SQIIdentityCard.m
//  LingXia
//
//  Created by HSQI on 2018/3/16.
//  Copyright © 2018年 3Fsports. All rights reserved.
//

#import "NSString+SQIIdentityCard.h"

@implementation NSString (SQIIdentityCard)

- (NSUInteger)sqi_getIdentityCardAge {
    
    // dateFmt
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"yyyy-MM-dd"];
    
    // 截取birthdayStr
    NSString *birthdayStr = [self birthdayStrFromIdentityCard:self];
    // date
    NSDate *bsyDate = [fmt dateFromString:birthdayStr];
    
    // age
    NSTimeInterval dateDiff = -[bsyDate timeIntervalSinceNow];
    NSUInteger age = trunc(dateDiff / (60 * 60 * 24)) / 365;
    return age;
}

- (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr {
    
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    
    NSString *year = nil;
    
    NSString *month = nil;
    
    NSString *day = nil;
    
    // 从第6位开始 截取8个数
    NSString *ageString = [numberStr substringWithRange:NSMakeRange(6, 8)];
    
    year = [ageString substringWithRange:NSMakeRange(0, 4)];
    
    month = [ageString substringWithRange:NSMakeRange(4, 2)];
    
    day = [ageString substringWithRange:NSMakeRange(6, 2)];
    
    [result appendString:year];
    
    [result appendString:@"-"];
    
    [result appendString:month];
    
    [result appendString:@"-"];
    
    [result appendString:day];

    return result;
}

@end
