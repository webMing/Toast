//
//  SteCommonSingleTitleAndActionView.m
//  LvTaotao
//
//  Created by XMYY-20 on 2018/5/15.
//  Copyright © 2018年 Kerwin. All rights reserved.
//

#import "SteCommonSingleTitleAndActionView.h"
#import <Masonry/Masonry.h>

@interface SteCommonSingleTitleAndActionView()
@property (strong, nonatomic) UILabel* seperaterLb;
@end

@implementation SteCommonSingleTitleAndActionView

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
// 点击按钮界面不一定会消失; 类似画中画的效果.
- (void)reflectionAction {
    [self dimissSelfWithType:SteAtionViewCommonAtionType];
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
        _titleLb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        _titleLb.textColor = [UIColor colorWithHexString:@"000000"];
        _titleLb.text = @"title titletitletitletitletitletitletitletitletitletitletitletitle";
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
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
    [self addSubview:self.titleLb];
    [self addSubview:self.seperaterLb];
    [self addSubview:self.actionBtn];
}

- (void)cLayoutSubViews {
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.offset(10.0f);
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
