//
//  SteCommonFromBottomUpViewObj.m
//  Toast
//
//  Created by Stephanie on 2018/5/28.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteCommonFromBottomUpViewObj.h"

@implementation SteCommonFromBottomUpViewObj

- (void)steWillShowAnimationView:(UIView *)view inContainterView:(UIView *)cview {
    [self ste_willShowView:view inContainterView:cview];
    cview.alpha = 0.0f;
}

- (void)steShowAnimationView:(UIView *)view inContainterView:(UIView *)cview {
    [view layoutIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        view.transform = CGAffineTransformTranslate(view.transform, 0, -CGRectGetHeight(view.bounds));
        cview.alpha = 1.0f;
    } completion:^(BOOL finished) {
          [self ste_didShowView:view inContainterView:cview];
    }];
}

- (void)steDissmissAnimationView:(UIView *)view inContainterView:(UIView *)cview {
    [self ste_willRemoveView:view fromContainView:cview];
    [UIView animateWithDuration:0.3 animations:^{
        view.transform = CGAffineTransformIdentity;
        cview.alpha = 0.3;
    } completion:^(BOOL finished) {
        if (finished) {
            [view removeFromSuperview];
            [self ste_didRemoveView:view fromContainView:cview];
        }
    }];
}
@end
