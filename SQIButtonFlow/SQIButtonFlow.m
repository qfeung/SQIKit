//
//  SQIButtonFlow.m
//  LingXia
//
//  Created by HSQI on 2017/11/30.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQIButtonFlow.h"
#define kEdgeMargin_leading (16 * kRatio)

@interface SQIButtonFlow ()

@property(nonatomic, strong) NSArray <UIButton *>*btnArr;

@end

@implementation SQIButtonFlow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Setters

/**
 只有文字的按钮流式布局

 @param sqi_btnArr 按钮的标题数组
 */
- (void)setSqi_btnArr:(NSArray *)sqi_btnArr {
    _sqi_btnArr = sqi_btnArr;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];

    CGFloat padding_width = 8 * kRatio;
    CGFloat padding_height = 8 * kRatio;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnH = 20 * kRatio;

    // 按钮容器
    NSMutableArray <UIButton *>*btnArr = [NSMutableArray array];
    for (int i = 0; i < self.sqi_btnArr.count; i++) {
        
        UIButton *btn = [UIButton new];
        btn.layer.cornerRadius = 10 * kRatio;
        [btn setBackgroundColor:self.sqi_btnBgColor];
        [btn setTitleColor:self.sqi_btnTextColor forState:UIControlStateNormal];
        btn.titleLabel.font = self.sqi_textFont;
        [btn setTitle:self.sqi_btnArr[i] forState:UIControlStateNormal];
        btn.tag = 10000 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:1 << 6];
        
        // 添加到按钮容器中
        [btnArr addObject:btn];
        //计算文字大小
        CGSize titleSize = [self.sqi_btnArr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, btnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil].size;
        CGFloat btnW = titleSize.width + 2 * padding_width;

        // 判断按钮是否超过了屏幕
        if (btnX + btnW > self.sqi_flowWidth) {
            btnX = 0;
            btnY += btnH + padding_height;
        }
        
        // 布局按钮的位置
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.offset(btnX);
            make.top.offset(btnY);
            make.height.offset(btnH);
            make.width.offset(btnW);
        }];
        
        // 更新起点坐标
        btnX += btnW + padding_width;
        
        if (i == self.sqi_btnArr.count - 1) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.offset(0);
            }];
        }
    }
    self.btnArr = btnArr;
}

- (void)setSqi_iconArr:(NSArray *)sqi_iconArr {
    _sqi_iconArr = sqi_iconArr;
    
    [self.btnArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setImage:sqi_localImage(sqi_iconArr[idx]) forState:UIControlStateNormal];
    }];
}
#pragma mark - Btn click action

- (void)btnClick:(UIButton *)btn {
    
}

@end
