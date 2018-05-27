//
//  SteCommonDoubleTitleAndActionView.m
//
//  Created by Stephanie on 2018/5/16.
//  Copyright © 2018年 Stephanie. All rights reserved.
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
        [self setUpView];
        [self addCustomViews];
        [self layoutCustomViews];
    }
    return self;
}


#pragma mark- SetUpView

- (void)setUpView {
    
}

- (void)addCustomViews {
    [self addSubview:self.largeTitleLb];
    [self addSubview:self.titleLb];
    [self addSubview:self.seperaterLb];
    [self addSubview:self.actionBtn];
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
    [self.actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.seperaterLb.mas_bottom);
        make.height.mas_equalTo(45.0f);
        make.leading.trailing.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

#pragma mark- EventRespone

- (void)reflectionAction {
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

@end
