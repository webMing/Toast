//
//  PopAnimationObj.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "PopAnimationObj.h"
#import "AnimationDelegate.h"

@interface PopAnimationObj()
@property (nonatomic, weak) UIView* animationView;
@property (nonatomic, weak) UIView* containerView;
@end

@implementation PopAnimationObj


- (void)addAnimationShowView:(AnimationSuperView *)view inContainterView:(UIView *)cView {
    
    if ([cView.subviews containsObject:view]) return;
    
    [self aniObj_willShowView:_animationView inContainterView:_containerView];
   
    _animationView = view;
    _containerView = cView;
    
    [_animationView layoutIfNeeded];
    [_containerView layoutIfNeeded];
    
    _animationView.frame = CGRectMake(0,CGRectGetHeight(_containerView.bounds), CGRectGetWidth(_containerView.bounds), CGRectGetHeight(_animationView.bounds));
    
    __block CGRect rect = _animationView.frame;
    
    [_containerView addSubview:_animationView];
    UIColor* color = [UIColor colorWithRed:5.0/255.0f green:2.0/255.0f blue:5.0/255.0f alpha:1.0];
    [_containerView setBackgroundColor:[color colorWithAlphaComponent:0.13f]];
         
    [UIView animateWithDuration:0.25 animations:^{
        rect.origin.y = CGRectGetHeight(self.containerView.bounds) - CGRectGetHeight(self.animationView.bounds);
        self.animationView.frame = rect;
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self aniObj_didShowView:self.animationView inContainterView:self.containerView];
        }
    }];
}

- (void)removeAnimationShowView:(UIView *)view inContainterView:(UIView *)cView {
    
    [self aniObj_willRemoveView:_animationView FromContainterView:_containerView];
    
    __block CGRect rect = _animationView.frame;
    
    [UIView animateWithDuration:0.25 animations:^{
        rect.origin.y = CGRectGetHeight(self.containerView.bounds);
        self.animationView.frame = rect;
    } completion:^(BOOL finished) {
        if (finished) {
            [self aniObj_didRemoveView:self.animationView FromContainterView:self.containerView];
            [self.animationView removeFromSuperview];
        }
    }];
    
}

@end
