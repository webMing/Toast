//
//  SteCommonSingleTitleAndActionView.m
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
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
        [self setUpView];
        [self addCustomViews];
        [self layoutCustomViews];
    }
    return self;
}

/* 代码已经迁移到父类
- (void)didMoveToSuperview {
    if (self.superview) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            //将来要把这个定义迁移出来.
            CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
            //make.width.mas_equalTo(screenWidth * 0.7);
            make.width.equalTo(@(screenWidth * 0.7));
            make.height.equalTo(self.mas_width).multipliedBy(0.54);
            make.center.equalTo(self.superview);
        }];
    }
}
 */


#pragma mark- SetUpView

- (void)setUpView {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)addCustomViews {
    [self addSubview:self.titleLb];
    [self addSubview:self.seperaterLb];
    [self addSubview:self.actionBtn];
}

- (void)layoutCustomViews {
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

#pragma mark- EventRespone
// 点击按钮界面不一定会消失; 类似画中画的效果.
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



@end
