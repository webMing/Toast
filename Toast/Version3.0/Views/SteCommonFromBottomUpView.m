//
//  SteCommonFromBottomUpView.m
//  Toast
//
//  Created by Stephanie on 2018/5/27.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteCommonFromBottomUpView.h"
#import "SteFont.h"
#import "SteColors.h"
#import <Masonry.h>

@interface SteCommonFromBottomUpView()
@property (strong, nonatomic) UILabel  * confirmLb;
@property (strong, nonatomic) UILabel  * cancelLb;
@property (strong, nonatomic) UIControl* confirmCtr;
@property (strong, nonatomic) UIControl* cancelCtr;

@property (assign, nonatomic) SEL actionSel;
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
    self.backgroundColor = [UIColor redColor];
    self.actionSel = @selector(cancleDelegateAction); //点击maskView 是cancel操作
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

- (void)didMoveToSuperview {
    if (self.superview) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.superview.mas_bottom);
            make.leading.trailing.equalTo(self.superview);
            make.height.equalTo(@120.0f);
        }];
    }
}

#pragma mark- EventRespone

- (void)confirmAction {
    self.actionSel = @selector(confirmDelegateAction);
    [self dimissSelf];
}

- (void)confirmDelegateAction {
    if (_externDelegate && [_externDelegate respondsToSelector:@selector(SteCommonFromBottomUpViewConfirm:)]) {
        [_externDelegate SteCommonFromBottomUpViewConfirm:self];
    }
}

- (void)cancelAction {
    self.actionSel = @selector(cancleDelegateAction);
    [self dimissSelf];
}

- (void)cancleDelegateAction {
    if (_externDelegate && [_externDelegate respondsToSelector:@selector(SteCommonFromBottomUpViewCancel:)]) {
        [_externDelegate SteCommonFromBottomUpViewCancel:self];
    }
}

- (void)dimissSelf {
    if (self.delegate && [self.delegate respondsToSelector:@selector(steDissmissAnimationView:inContainterView:)]) {
        [self.delegate steDissmissAnimationView:self inContainterView:self.superview];
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
    //NSLog(@"%s",__FUNCTION__);
    [self performSelector:self.actionSel withObject:self];
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

@end
