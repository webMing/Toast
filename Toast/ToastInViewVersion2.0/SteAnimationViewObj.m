//
//  SteAnimationViewObj.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/17.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteAnimationViewObj.h"
#import <UIKit/UIKit.h>

@interface SteAnimationViewObj()

@end

@implementation SteAnimationViewObj

#pragma mark- LifeCicle

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- SteAnimationViewDelegate

- (void)steShowAnimationView:(UIView*)view inContainterView:(UIView*)cview {
    
    [self ste_willShowView:view inContainterView:cview];
    
    [view layoutIfNeeded];
    [cview layoutIfNeeded];
    
    view.frame = CGRectMake(0,CGRectGetHeight(cview.bounds), CGRectGetWidth(cview.bounds), CGRectGetHeight(view.bounds));
    
    __block CGRect rect = view.frame;
    
    [UIView animateWithDuration:0.25 animations:^{
        rect.origin.y = CGRectGetHeight(cview.bounds) - CGRectGetHeight(view.bounds);
        view.frame = rect;
        UIColor* color = [UIColor colorWithRed:5.0/255.0f green:2.0/255.0f blue:5.0/255.0f alpha:1.0];
        [cview setBackgroundColor:[color colorWithAlphaComponent:0.13f]];
    } completion:^(BOOL finished) {
        if (finished) {
            [self ste_didShowView:view inContainterView:cview];
        }
    }];
}

- (void)steDissmissAnimationView:(UIView*)view inContainterView:(UIView*)cview {
    
    [self ste_willRemoveView:view fromContainView:cview];

    __block CGRect rect = view.frame;
    
    [UIView animateWithDuration:0.25 animations:^{
        rect.origin.y = CGRectGetHeight(cview.bounds);
        view.frame = rect;
    } completion:^(BOOL finished) {
        if (finished) {
            [self ste_didRemoveView:view fromContainView:cview];
            [view removeFromSuperview];
            [cview removeFromSuperview];
        }
    }];
}

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

@end
