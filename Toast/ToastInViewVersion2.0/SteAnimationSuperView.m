//
//  SteAnimationSuperView.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/17.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteAnimationSuperView.h"
#import "SteAnimationMaskView.h"

#import <Masonry.h>

/*
  1.提供对外的接口
  2.AOP MaskView 并设置为MaskView delegate
 */

@interface SteAnimationSuperView() <SteAnimationMaskViewDelegate>

@end

@implementation SteAnimationSuperView

#pragma mark- LifeCicle

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- SteAnimationMaskViewDelegate

- (void)dissmissMaskView:(SteAnimationMaskView *)view {
    if (_aniObj && [_aniObj respondsToSelector:@selector(steDissmissAnimationView:inContainterView:)]) {
        [_aniObj steDissmissAnimationView:self inContainterView:self.superview];
    }
}

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

- (void)showInContainView:(UIView*)cvi withAnimationObj:(id<SteAnimationViewDelegate>)obj {
    if (obj && [obj respondsToSelector:@selector(steShowAnimationView:inContainterView:)]) {
        SteAnimationMaskView* maskView = [[SteAnimationMaskView alloc]initWithFrame:cvi.bounds];
        maskView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        maskView.delegate = self;
        
        self.aniObj = obj;
        obj.delegate = self;
        [cvi addSubview:maskView];
        [maskView addSubview:self];
        if (@available(iOS 11.0, *)) {
            /* 这种方法也是可以的
            [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.insets = cvi.safeAreaInsets;
            }];
             */
            /* Masonry 系统提供的方法
            [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cvi.mas_safeAreaLayoutGuideTop);
                make.bottom.equalTo(cvi.mas_safeAreaLayoutGuideBottom);
                make.left.equalTo(cvi.mas_safeAreaLayoutGuideLeft);
                make.right.equalTo(cvi.mas_safeAreaLayoutGuideRight);
            }];*/
            
           maskView.translatesAutoresizingMaskIntoConstraints = NO;
           NSLayoutConstraint* leading = [maskView.leadingAnchor constraintEqualToAnchor:cvi.safeAreaLayoutGuide.leadingAnchor];
           NSLayoutConstraint*  trailing = [maskView.trailingAnchor constraintEqualToAnchor:cvi.safeAreaLayoutGuide.trailingAnchor];
           NSLayoutConstraint* top = [maskView.topAnchor constraintEqualToAnchor:cvi.safeAreaLayoutGuide.topAnchor];
           NSLayoutConstraint* bottom = [maskView.bottomAnchor constraintEqualToAnchor:cvi.safeAreaLayoutGuide.bottomAnchor];
           [NSLayoutConstraint activateConstraints:@[leading,trailing,top,bottom]];
            
        } else {
            /*
            [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
            }];
             */
            
            //.topLayoutGuide.bottomAnchor  //UIViewController
            //.bottomLayoutGuide.topAnchor  //UIViewController
            maskView.translatesAutoresizingMaskIntoConstraints = NO;
            NSLayoutConstraint* leading = [maskView.leadingAnchor constraintEqualToAnchor:cvi.leadingAnchor];
            NSLayoutConstraint*  trailing = [maskView.trailingAnchor constraintEqualToAnchor:cvi.trailingAnchor];
            NSLayoutConstraint* top = [maskView.topAnchor constraintEqualToAnchor:cvi.bottomAnchor];
            NSLayoutConstraint* bottom = [maskView.bottomAnchor constraintEqualToAnchor:cvi.bottomAnchor];
            [NSLayoutConstraint activateConstraints:@[leading,trailing,top,bottom]];
        }
        
        [self.aniObj steShowAnimationView:self inContainterView:self.superview];
    }
}

@end
