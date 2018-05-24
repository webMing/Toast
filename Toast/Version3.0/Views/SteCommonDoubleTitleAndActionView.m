//
//  SteCommonDoubleTitleAndActionView.m
//  LvTaotao
//
//  Created by XMYY-20 on 2018/5/16.
//  Copyright © 2018年 Kerwin. All rights reserved.
//

#import "SteCommonDoubleTitleAndActionView.h"
#import <Masonry/Masonry.h>

@interface SteCommonDoubleTitleAndActionView ()
@property (strong, nonatomic) UILabel* seperaterLb;
@end

@implementation SteCommonDoubleTitleAndActionView

#pragma mark- LifeCicle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

#pragma mark- CreateUI

- (void)setUpUI {
    [self cAddSubViews];
    [self cLayoutSubViews];
}

#pragma mark- EventRespone

- (void)reflectionAction {
    [super dimissSelfWithType:SteAtionViewCommonAtionType];
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

- (UIButton*)actionBtn {
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_actionBtn.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15]];
        [_actionBtn setTitleColor:[UIColor colorWithHexString:@"007AFF"] forState:UIControlStateNormal];
        [_actionBtn setTitle:@"Action" forState:UIControlStateNormal];
        [_actionBtn addTarget:self action:@selector(reflectionAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
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

#pragma mark- PrivateMethod

- (void)cAddSubViews {
    [self addSubview:self.largeTitleLb];
    [self addSubview:self.titleLb];
    [self addSubview:self.seperaterLb];
    [self addSubview:self.actionBtn];
}

- (void)cLayoutSubViews {
    
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
    [self.actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.seperaterLb.mas_bottom);
        make.height.mas_equalTo(45.0f);
        make.leading.trailing.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
    }];

}

@end
