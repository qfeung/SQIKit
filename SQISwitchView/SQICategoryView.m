//
//  SQICategoryView.m
//  云蛛网络
//
//  Created by 侯仕奇 on 2017/1/17.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "SQICategoryView.h"

@interface SQICategoryView ()

/**
 *  第一个按钮
 */
@property (weak, nonatomic) UIButton *firstBtn;

/**
 *  Btn选中状态标识线
 */
@property (strong, nonatomic) UIView *lineView;

/**
 *  负责记录选中的按钮
 */
@property (weak, nonatomic) UIButton *selectBtn;

@end

@implementation SQICategoryView {
    /**
     *  保存所有分类按钮的集合
     */
    NSArray<UIButton *> *_btnsArr;
    /**
     *  存放按钮标题的容器
     */
    NSArray<NSString *> *_titleArr;
    
    UIColor *_btnColor;
}

- (instancetype)initWithTitleArr:(NSArray *)titleArr btnColor:(UIColor *)btnColor {
    self = [super init];
    if (self) {
        _titleArr = titleArr;
        _btnColor = btnColor;
        [self setupUI];
    }
    return self;
}

//- (void)drawRect:(CGRect)rect {

//    //一像素的黑线
//    CGFloat onePx = 1 / [UIScreen mainScreen].scale;
//    // 计算Y
////    CGFloat lineY = 44;
//    //空路径
//    UIBezierPath* line = [UIBezierPath bezierPath];
//    //绘制路径
//    [line moveToPoint:CGPointMake(0, 44)];
//    [line addLineToPoint:CGPointMake(kScreenWidth, 44)];
//    //路径属性---颜色
//    [[UIColor darkGrayColor] set];
//    //路径属性
//    [line setLineWidth:onePx];
//    //渲染
//    [line stroke];

//    //白色矩形
//    //路径
//    UIBezierPath* path = [UIBezierPath bezierPathWithRect:self.bounds];
//    //路径属性---颜色
//    [[UIColor colorWithHex:0x283444] set];
//    //渲染
//    [path fill];//若fill-->stroke,则只有一个黄色的框

//}

#pragma mark - UI

-(void)setupUI {
    
    self.backgroundColor = [UIColor themeGrayColor];
    
    [_titleArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 1. 创建按钮
        UIButton *btn = [UIButton sqi_buttonForNormalStateWithFont:sqi_font(13) titleColor:[UIColor lightGrayColor] title:obj];
        [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateSelected];        
        [btn setBackgroundColor:_btnColor];
        
        // 2. 添加按钮
        [self addSubview:btn];
        
        // 3. 记录第一个按钮, 用于设置线约束做参照!
        if (idx == 0) {
            _firstBtn = btn;
            // 让订单按钮为选中状态!
            _firstBtn.selected = YES;
            // 记录按钮
            _selectBtn = _firstBtn;
        }
        
        // 4. 为每个按钮添加点击事件
        [btn addTarget:self action:@selector(categoryBtnClick:) forControlEvents:1 << 6];
    }];
    
    _btnsArr = self.subviews;
    
    // 2.布局3个按钮
    [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self);
        make.bottom.equalTo(self).offset(-1);
    }];
    
    // Btn底部选中状态指示条
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(kScreenWidth / _titleArr.count * 0.618);
        make.bottom.equalTo(_firstBtn);
        make.centerX.equalTo(_firstBtn);
        make.height.mas_equalTo(4);
    }];
    
//    // 最底部分界线
//    UIView *boundaryView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, kScreenWidth, 1)];
//    boundaryView.backgroundColor = [UIColor themeGrayColor];
//    [self addSubview:boundaryView];
}

#pragma mark - 按钮的监听方法

- (void)categoryBtnClick:(UIButton *)sender {
    
    // 获取按钮在集合中的索引
    _pageNumber = [_btnsArr indexOfObject:sender];
    
    // 发送valueChanged事件
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    // 记录选中的按钮
    _selectBtn = sender;
}

#pragma mark - 重写set方法,进行偏移

- (void)setOffset_x:(CGFloat)offset_x {
    
    _offset_x = offset_x;
    
    // 1. ------让黄条动!------
    [_lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        // 让黄线的中心的x进行偏移
        make.centerX.equalTo(_firstBtn).offset(offset_x);
        
    }];
    
    // 布局
    [self layoutIfNeeded];
    
    // 2. ------改变按钮状态------
    NSInteger idx = offset_x / _firstBtn.bounds.size.width + 0.5;
    
    // 设置按钮的状态
    _selectBtn.selected = NO;// 将之前保存的按钮设置为NO!
    
    _btnsArr[idx].selected = YES;// 设置当前选中的按钮为YES!
    
    // 3. ------记录选中的按钮------
    _selectBtn = _btnsArr[idx];
}

@end
