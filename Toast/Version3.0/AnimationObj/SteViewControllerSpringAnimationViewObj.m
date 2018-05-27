//
//  SteViewControllerSpringAnimationViewObj.m
//  Toast
//
//  Created by Stephanie on 2018/5/26.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteViewControllerSpringAnimationViewObj.h"

@implementation SteViewControllerSpringAnimationViewObj

- (void)steShowAnimationView:(UIView *)view inContainterView:(UIView *)cview {
    [self ste_willShowView:view inContainterView:cview];
    CGAffineTransform trans = CGAffineTransformScale(view.transform, 0.001, 0.001);
    view.transform = trans;  // do it instantly, no animation
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        view.transform = CGAffineTransformScale(view.transform, 1000.0f, 1000.0f);
    } completion:^(BOOL finished) {
          [self ste_didShowView:view inContainterView:cview];
    }];
}

- (void)steDissmissAnimationView:(UIView *)view inContainterView:(UIView *)cview {
    [self ste_willRemoveView:view fromContainView:cview];
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        view.transform = CGAffineTransformScale(view.transform, 0.001f, 0.001f);
        view.alpha = 0.3f;
        cview.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        if (finished) {
            [view removeFromSuperview];
            //这里不会为nil,view 与 cview被viewControllor强引用;
            [self ste_didRemoveView:view fromContainView:cview];
        }
    }];
}

@end
