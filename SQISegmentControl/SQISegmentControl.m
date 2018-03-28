//
//  SQISegmentControl.m
//  LingXia
//
//  Created by HSQI on 2017/12/5.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQISegmentControl.h"

@interface SQISegmentControl ()

@property(nonatomic, strong) NSArray <NSString *>*titleArr;

@property(nonatomic, strong) NSArray <UIButton *>*btnArr;

@end

@implementation SQISegmentControl

- (instancetype)initWithItems:(nullable NSArray *)items
{
    self = [super init];
    if (self) {
        self.titleArr = items;
        [self setupUI];
    }
    return self;
}

#pragma mark - UI

- (void)setupUI {
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i = 0; i < self.titleArr.count; i++)
    {
        UIButton *btn = [UIButton new];
        [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor themeLightBlueColor];
        btn.titleLabel.font = sqi_font(13);
        [self addSubview:btn];
        [tempArr addObject:btn];
        btn.tag = i + 10000;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:1 << 6];
    }
    self.btnArr = tempArr;
    [Common makeEqualWidthViews:self.btnArr inView:self LRpadding:0 viewPadding:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.btnArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.layer.cornerRadius = self.sqi_height / 2;
    }];
}

#pragma mark - Btn click action

- (void)btnClick:(UIButton *)btn {
    self.selectedSegmentIndex = btn.tag - 10000;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark - Setters

- (void)setTintColor:(UIColor *)tintColor {
    [self.btnArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [obj setTitleColor:[UIColor themeLightBlueColor] forState:UIControlStateNormal];
    }];
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex {
    _selectedSegmentIndex = selectedSegmentIndex;
    
    [self.btnArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected = NO;
        obj.backgroundColor = [UIColor whiteColor];
    }];
    self.btnArr[selectedSegmentIndex].selected = YES;
    self.btnArr[selectedSegmentIndex].backgroundColor = [UIColor themeLightBlueColor];
}

@end
