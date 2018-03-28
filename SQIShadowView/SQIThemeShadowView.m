//
//  SQIThemeShadowView.m
//  LingXia
//
//  Created by HSQI on 2018/3/6.
//  Copyright © 2018年 3Fsports. All rights reserved.
//

#import "SQIThemeShadowView.h"

@implementation SQIThemeShadowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = kThemeShadowColor;
        self.layer.shadowOffset = kThemeShadowOffset;
        self.layer.shadowOpacity = kThemeShadowOpacity;
        self.layer.cornerRadius = kThemeCornerRadius;
        self.layer.shadowRadius = kThemeShadowRadius;
    }
    return self;
}

@end
