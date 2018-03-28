//
//  SQISwitchView.m
//  LingXia
//
//  Created by HSQI on 2017/8/28.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQISwitchView.h"
#import "SQICategoryView.h"

@interface SQISwitchView () <UIScrollViewDelegate>

/**
 分类按钮视图
 */
@property(nonatomic, weak) SQICategoryView *categoryView;

/**
 滚动视图
 */
@property(nonatomic, weak) UIScrollView *mainScrollView;

/**
 滚动视图上的子视图集合
 */
@property(nonatomic, strong) NSArray <UIView *>* scrSubviews;

/**
 分类按钮的标题集合
 */
@property(nonatomic, strong) NSArray <NSString *>* titles;

@end

@implementation SQISwitchView

#pragma mark - Init

- (instancetype)initWithTitles:(NSArray <NSString *>*)titles subviews:(NSArray <UIView *>*)subviews {
    if ([self init]) {
        
        self.scrSubviews = subviews;
        self.titles = titles;
        [self setupUIWithTitles:(NSArray <NSString *>*)titles subviews:(NSArray <UIView *>*)subviews];
    }
    return self;
}

#pragma mark - UI

- (void)setupUIWithTitles:(NSArray <NSString *>*)titles subviews:(NSArray <UIView *>*)subviews {
    
    self.backgroundColor = [UIColor blueColor];
    // 分类按钮视图
    SQICategoryView *categoryView = [[SQICategoryView alloc] initWithTitleArr:titles btnColor:[UIColor whiteColor]];
    categoryView.backgroundColor = [UIColor whiteColor];
    [self addSubview:categoryView];
    [categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.offset(0);
        make.height.offset(44 * kRatio);
    }];
    
    // 监听事件 值改变事件
    [categoryView addTarget:self action:@selector(categoryViewValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.categoryView = categoryView;
    
    // ScrollView
    UIScrollView *mainScrollView = [[UIScrollView alloc] init];
    mainScrollView.bounces = NO;
    mainScrollView.pagingEnabled = YES;
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.delegate = self;
    
    [self addSubview:mainScrollView];
    [mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(categoryView.mas_bottom);
        make.leading.trailing.offset(0);
        make.bottom.offset(0);
    }];
    self.mainScrollView = mainScrollView;
    
    [subviews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mainScrollView addSubview:obj];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.mainScrollView.contentSize = CGSizeMake(self.frame.size.width * self.titles.count, self.bounds.size.height - self.categoryView.bounds.size.height);
    
    [self.scrSubviews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(self.frame.size.width * idx, 0, self.frame.size.width, self.sqi_height - 44 * kRatio);
    }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if ([scrollView isEqual:self.mainScrollView]) {
        
        CGFloat offset_X = scrollView.contentOffset.x;
        
        [self.categoryView setOffset_x:(offset_X / self.titles.count)];
    }
}


#pragma mark - Selectors

/// 分类视图的值改变事件
- (void)categoryViewValueChanged:(SQICategoryView *)sender {
    
    // 让scrollView滚动
    CGRect rect = CGRectMake(self.frame.size.width * sender.pageNumber, 44 * kRatio, self.frame.size.width, self.bounds.size.height - 44 * kRatio);
    
    [self.mainScrollView scrollRectToVisible:rect animated:YES];
}

@end
