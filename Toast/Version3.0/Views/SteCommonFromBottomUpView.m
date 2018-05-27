//
//  SteCommonFromBottomUpView.m
//  Toast
//
//  Created by Stephanie on 2018/5/27.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteCommonFromBottomUpView.h"
#import <Masonry.h>

@interface SteCommonFromBottomUpView()
@property (strong, nonatomic) UILabel  * confirmLb;
@property (strong, nonatomic) UILabel  * cancelLb;
@property (strong, nonatomic) UIControl* confirmCtr;
@property (strong, nonatomic) UIControl* cancelCtr;
@end

@implementation SteCommonFromBottomUpView

#pragma mark- LifeCicle
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
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
    [self.confirmCtr addSubview:self.confirmLb];
    [self.cancelCtr  addSubview:self.cancelLb];
    [self addSubview:self.confirmCtr];
    [self addSubview:self.cancelCtr];
}

- (void)layoutCustomViews {
    [self.confirmCtr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(self.mas_centerX).offset(-20.0f);
    }];
    
    [self.cancelCtr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.leading.equalTo(self.mas_centerX).offset(20.0f);
    }];
    
    [self.confirmLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
    
    [self.cancelLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
    
}

#pragma mark- EventRespone
/*
- (void)confirmAction {
//    if (_delegate && [_delegate respondsToSelector:@selector(confirmWithanimationView:)]) {
//        [_delegate confirmWithanimationView:self];
//    }
    [self dimissSelf];
}

- (void)cancelAction {
    if (_delegate && [_delegate respondsToSelector:@selector(cancelWithanimationView:)]) {
        [_delegate cancelWithanimationView:self];
    }
    [self dimissSelf];
}

- (void)dimissSelf {
    if (self.aniObj && [self.aniObj respondsToSelector:@selector(steDissmissAnimationView:inContainterView:)]) {
        [self.aniObj steDissmissAnimationView:self inContainterView:self.superview];
    }
}

#pragma mark- EventRespone

#pragma mark- SteAnimationViewObjDelegate

- (void)steWillShowView:(UIView*)view inContainterView:(UIView*)cview {
    NSLog(@"%s",__FUNCTION__);
}

- (void)steDidShowView:(UIView*)view inContainterView:(UIView*)cview {
    NSLog(@"%s",__FUNCTION__);
}

- (void)steWillRemoveView:(UIView*)view fromContainView:(UIView*)conv{
    NSLog(@"%s",__FUNCTION__);
}

- (void)steDidRemoveView:(UIView*)view fromContainView:(UIView*)conv{
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter
- (UILabel*)cancelLb {
    if (!_cancelLb) {
        _cancelLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _cancelLb.textAlignment = NSTextAlignmentCenter;
        _cancelLb.font = StePF_Light_Font_Size(15.0f);
        _cancelLb.textColor = Ste_Comfirm_Color;
        _cancelLb.text = @"取消";
    }
    return _cancelLb;
}

- (UILabel*)confirmLb {
    if (!_confirmLb) {
        _confirmLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _confirmLb.textAlignment = NSTextAlignmentCenter;
        _confirmLb.font = StePF_Light_Font_Size(15.0f);
        _confirmLb.textColor = Ste_Cancle_Color;
        _confirmLb.text = @"确定";
    }
    return _confirmLb;
}

- (UIControl*)confirmCtr {
    if (!_confirmCtr) {
        _confirmCtr = [[UIControl alloc]initWithFrame:CGRectZero];
        [_confirmCtr addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmCtr;
}

- (UIControl*)cancelCtr {
    if (!_cancelCtr) {
        _cancelCtr = [[UIControl alloc]initWithFrame:CGRectZero];
        [_cancelCtr addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelCtr;
}
#pragma mark- PrivateMethod
*/
@end
