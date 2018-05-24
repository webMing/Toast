//
//  SteSpringAnimationView.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/20.
//  Copyright © 2018年 Stephanie. All rights reserved.
//


#define MAS_SHORTHAND_GLOBALS 1

#import "SteSpringAnimationView.h"
#import "SteFont.h"
#import "SteColors.h"
#import <Masonry.h>

static const CGFloat TilteLableLessHeight = 50;
static const CGFloat ActionHeight = 50;

@interface SteSpringAnimationView()
@property (strong, nonatomic) UILabel  * titleLb;
@property (strong, nonatomic) UILabel  * confirmLb;
@property (strong, nonatomic) UILabel  * cancelLb;
@property (strong, nonatomic) UIControl* confirmCtr;
@property (strong, nonatomic) UIControl* cancelCtr;
@property (strong, nonatomic) UIView   * hSeperaterView;
@property (strong, nonatomic) UIView   * vSeperaterView;
@end

@implementation SteSpringAnimationView

#pragma mark- LifeCicle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUi];
        [self addCustomSubViews];
        [self layoutCustomSubViews];
    }
    return self;
}

- (void)didMoveToSuperview {
    
    /*
     1. 解决在 alloc 中添加约束时因为super.view = nil造成崩溃
     2. 第二种方法是 重写showInContainterView: withAnimationObj: 然后在其中完成布局;
     */
    
    if (self.superview) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            //将来要把这个定义迁移出来.
            CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
            //make.width.mas_equalTo(screenWidth * 0.7);
            make.width.equalTo(screenWidth * 0.7);
            make.height.equalTo(self.mas_width).multipliedBy(0.54);
            make.center.equalTo(self.superview);
        }];
    }
    
}

#pragma mark- CreateUI

- (void)setUpUi {
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 6.0f;
}

- (void)addCustomSubViews {
    [self addSubview:self.titleLb];
    [self addSubview:self.vSeperaterView];
    [self addSubview:self.hSeperaterView];
    [self.confirmCtr addSubview:self.confirmLb];
    [self.cancelCtr  addSubview:self.cancelLb];
    [self addSubview:self.confirmCtr];
    [self addSubview:self.cancelCtr];
}

- (void)layoutCustomSubViews {
    
    /*
     根据参照物确定: 在左为正,在右为负，在上为正，在下为负
     */
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        //对比使用的方法
        make.top.equalTo(@10);
        make.height.greaterThanOrEqualTo(@(TilteLableLessHeight));
        //make.height.mas_greaterThanOrEqualTo(TilteLableLessHeight);
        //make.leading.equalTo(@10);
        //make.leading.equalTo(self).offset(10.0f);
        //make.trailing.equalTo(@-10);
        //make.trailing.equalTo(self).offset(-10.0f);
        make.leading.offset(10).and.trailing.offset(-10);

    }];
    
    [self.hSeperaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLb.mas_bottom).offset(10.0f);
        make.leading.trailing.equalTo(self);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
    
    [self.vSeperaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hSeperaterView.mas_bottom);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(1/[UIScreen mainScreen].scale);
        make.height.mas_equalTo(ActionHeight);
        make.centerX.equalTo(self);
    }];
    
    [self.confirmCtr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.bottom.equalTo(self.vSeperaterView);
        make.trailing.equalTo(self.vSeperaterView.mas_leading);
    }];
    
    [self.cancelCtr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.vSeperaterView.mas_trailing);
        make.top.bottom.equalTo(self.vSeperaterView);
        make.trailing.equalTo(self);
    }];
    
    [self.confirmLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
    
    [self.cancelLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
    
    //在创建的时候创建约束,这个时候self.super = nil masonry 崩溃;
//    [self mas_makeConstraints:^(MASConstraintMaker *make) {
//        //将来要把这个定义迁移出来.
//        CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
//        make.width.mas_equalTo(screenWidth * 0.7);
//        make.height.equalTo(make.width);
//        //make.center.equalTo(self.superview);
//    }];
    
}

#pragma mark- EventRespone

- (void)confirmAction {
    if (_delegate && [_delegate respondsToSelector:@selector(springAnimationViewConfirmWithView:)]) {
        [_delegate springAnimationViewConfirmWithView:self];
    }
    [self dimissSelf];
}

- (void)cancelAction {
    if (_delegate && [_delegate respondsToSelector:@selector(springAnimationViewCancelWithView:)]) {
        [_delegate springAnimationViewCancelWithView:self];
    }
    [self dimissSelf];
}

- (void)dimissSelf {
    if (self.aniObj && [self.aniObj respondsToSelector:@selector(steDissmissAnimationView:inContainterView:)]) {
        [self.aniObj steDissmissAnimationView:self inContainterView:self.superview];
    }
}

#pragma mark- CustomDelegateMethod

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

#pragma mark- GetterAndSetter

- (UILabel*)titleLb {
    if (!_titleLb) {
        
        _titleLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLb.backgroundColor = [UIColor redColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.textColor = [UIColor blackColor];
        _titleLb.text = @"SegmentFault区";
        _titleLb.numberOfLines = 0;
        _titleLb.font = StePF_Medium_Font_Size(17);
    }
    return _titleLb;
}

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

- (UIView*)hSeperaterView {
    if (!_hSeperaterView) {
        _hSeperaterView = [[UIView alloc]initWithFrame:CGRectZero];
        _hSeperaterView.backgroundColor = Ste_Seperater_Color;
    }
    return _hSeperaterView;
}

- (UIView*)vSeperaterView {
    if (!_vSeperaterView) {
        _vSeperaterView = [[UIView alloc]initWithFrame:CGRectZero];
        _vSeperaterView.backgroundColor = Ste_Seperater_Color;
    }
    return _vSeperaterView;
}

#pragma mark- PrivateMethod



@end
