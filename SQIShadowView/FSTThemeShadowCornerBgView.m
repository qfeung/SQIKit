//
//  FSTThemeShadowCornerBgView.m
//  LingXia
//
//  Created by HSQI on 2018/3/6.
//  Copyright © 2018年 3Fsports. All rights reserved.
//

#import "FSTThemeShadowCornerBgView.h"

@interface FSTThemeShadowCornerBgView ()

@property(nonatomic, weak) UIView *superview;

@property(nonatomic, weak) SQIThemeShadowView *shadowView;

@end

@implementation FSTThemeShadowCornerBgView

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
        self.layer.cornerRadius = 7.0f;
        self.clipsToBounds = YES;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 1 / kScreenScale;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    _superview = newSuperview;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
        if (_shadowView) {
            [_shadowView removeFromSuperview];
        }
    
        SQIThemeShadowView *toView = [SQIThemeShadowView new];
        [_superview insertSubview:toView atIndex:0];
        [toView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.leading.trailing.equalTo(self);
        }];
        self.shadowView = toView;
}

- (void)dealloc {
    if (_shadowView) {
        [_shadowView removeFromSuperview];
    }
}

@end
