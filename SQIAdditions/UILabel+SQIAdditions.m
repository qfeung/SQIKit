//
//  UILabel+SQIAdditions.m
//  LingXia
//
//  Created by 侯仕奇 on 2017/7/28.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "UILabel+SQIAdditions.h"

@implementation UILabel (SQIAdditions)

static char *sqi_lineSpacingKey = "sqi_lineSpacingKey";

/// sqi_custom_label_constructor
+ (instancetype)sqi_labelWithFont:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text {
    
    UILabel *label = [UILabel new];
    label.text = text;
    label.textColor = textColor;
    if (font != nil) {
        label.font = font;
    }
    
    return label;
}

#pragma mark - Setters

- (void)setSqi_lineSpacing:(CGFloat)sqi_lineSpacing {
    objc_setAssociatedObject(self, sqi_lineSpacingKey, @(sqi_lineSpacing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (self.text != nil) {
        NSString *labelText = self.text;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:sqi_lineSpacing];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
        self.attributedText = attributedString;
        [self sizeToFit];
    }
}

#pragma mark - Getters

- (CGFloat)sqi_lineSpacing {
    return [objc_getAssociatedObject(self, sqi_lineSpacingKey) floatValue];
}

@end
