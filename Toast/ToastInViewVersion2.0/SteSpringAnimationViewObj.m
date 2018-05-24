//
//  SteSpringAnimationViewObj.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/20.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteSpringAnimationViewObj.h"

@interface SteSpringAnimationViewObj()

@end

@implementation SteSpringAnimationViewObj

- (void)steShowAnimationView:(UIView*)view inContainterView:(UIView*)cview {
    
    [self ste_willShowView:view inContainterView:cview];
    
    [view layoutIfNeeded];
    [cview layoutIfNeeded];
    
    view.transform  = CGAffineTransformScale(view.transform, 0.001, 0.001);
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        view.transform = CGAffineTransformIdentity;
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

    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        view.transform = CGAffineTransformScale(view.transform, 0.001, 0.001);
        view.alpha = 0.3;
        cview.alpha = 0.3;
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
