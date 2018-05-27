//
//  SteCommonDoubleTitleAndDoubleActionView.m
//
//  Created by Stephanie on 2018/5/16.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteCommonDoubleTitleAndDoubleActionView.h"
#import <Masonry/Masonry.h>

@interface SteCommonDoubleTitleAndDoubleActionView()

@property (strong, nonatomic) UILabel* seperaterLb;
@property (strong, nonatomic) UILabel* vSeperaterLb;

@end

@implementation SteCommonDoubleTitleAndDoubleActionView

#pragma mark- LifeCicle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpViews];
        [self addCustomViews];
        [self layoutCustomViews];
    }
    return self;
}

#pragma mark- SetUpView
- (void)setUpViews {
    
}

- (void)addCustomViews {
    [self addSubview:self.largeTitleLb];
    [self addSubview:self.titleLb];
    [self addSubview:self.seperaterLb];
    [self addSubview:self.vSeperaterLb];
    [self addSubview:self.rightActionBtn];
    [self addSubview:self.leftActionBtn];
}

- (void)layoutCustomViews {
    [self.largeTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.offset(10.0f);
        make.trailing.offset(-10.0f);
    }];
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.largeTitleLb.mas_bottom).offset(10.0f);
        make.leading.offset(10.0f);
        make.trailing.offset(-10.0f);
    }];
    [self.seperaterLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLb.mas_bottom).offset(10);
        make.leading.trailing.equalTo(self);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
    
    [self.vSeperaterLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(45.0f);
        make.width.mas_equalTo(1/[UIScreen mainScreen].scale);
        make.centerX.equalTo(self);
        make.top.equalTo(self.seperaterLb.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [self.rightActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.trailing.equalTo(self.vSeperaterLb.mas_leading);
        make.bottom.top.equalTo(self.vSeperaterLb);
    }];
    
    [self.leftActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.vSeperaterLb);
        make.leading.equalTo(self.vSeperaterLb);
        make.trailing.equalTo(self.mas_trailing);
    }];
}

#pragma mark- EventRespone

- (void)leftAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(steDissmissAnimationView:inContainterView:) ]) {
        [self.delegate steDissmissAnimationView:self inContainterView:self.superview];
    }
}

- (void)rightAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(steDissmissAnimationView:inContainterView:) ]) {
        [self.delegate steDissmissAnimationView:self inContainterView:self.superview];
    }
}

#pragma mark- SteViewControllerAnimationObjDelegate

- (void)steWillShowView:(UIView *)view inContainterView:(UIView *)cview {
    NSLog(@"%@",NSStringFromSelector(@selector(steDidRemoveView:fromContainView:)));
}

- (void)steDidShowView:(UIView *)view inContainterView:(UIView *)cview {
    NSLog(@"%@",NSStringFromSelector(@selector(steDidRemoveView:fromContainView:)));
}

- (void)steWillRemoveView:(UIView *)view fromContainView:(UIView *)conv {
    NSLog(@"%@",NSStringFromSelector(@selector(steDidRemoveView:fromContainView:)));
}

- (void)steDidRemoveView:(UIView *)view fromContainView:(UIView *)conv {
    /*只能用作更新View状态*/
    NSLog(@"%@",NSStringFromSelector(@selector(steDidRemoveView:fromContainView:)));
}

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

- (UIButton*)rightActionBtn {
    if (!_rightActionBtn) {
        _rightActionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_rightActionBtn.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15]];
        [_rightActionBtn setTitleColor:[UIColor colorWithHexString:@"007AFF"] forState:UIControlStateNormal];
        [_rightActionBtn setTitle:@"RightAction" forState:UIControlStateNormal];
        [_rightActionBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightActionBtn;
}

- (UIButton*)leftActionBtn {
    if (!_leftActionBtn) {
        _leftActionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_leftActionBtn.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15]];
        [_leftActionBtn setTitleColor:[UIColor colorWithHexString:@"007AFF"] forState:UIControlStateNormal];
        [_leftActionBtn setTitle:@"LeftAction" forState:UIControlStateNormal];
        [_leftActionBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftActionBtn;
}

- (UILabel*)titleLb {
    
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _titleLb.textColor = [UIColor colorWithHexString:@"000000"];
        _titleLb.text = @"title";
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (UILabel*)largeTitleLb {
    if (!_largeTitleLb) {
        _largeTitleLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _largeTitleLb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        _largeTitleLb.textColor = [UIColor colorWithHexString:@"000000"];
        _largeTitleLb.text = @"large Title";
        _largeTitleLb.textAlignment = NSTextAlignmentCenter;
        _largeTitleLb.numberOfLines = 0;
    }
    return _largeTitleLb;
}


- (UILabel*)seperaterLb {
    if (!_seperaterLb) {
        _seperaterLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _seperaterLb.backgroundColor = [UIColor colorWithHexString:@"EBEBEB"];
    }
    return _seperaterLb;
}

- (UILabel*)vSeperaterLb {
    if (!_vSeperaterLb) {
        _vSeperaterLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _vSeperaterLb.backgroundColor = [UIColor colorWithHexString:@"EBEBEB"];
    }
    return _vSeperaterLb;
}

#pragma mark- PrivateMethod

@end
