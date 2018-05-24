//
//  AnimationViewCtrl.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "AnimationViewCtrl.h"

@interface AnimationViewCtrl () <UIGestureRecognizerDelegate>
@property (strong,nonatomic) UIView* baseView;
@end

@implementation AnimationViewCtrl

+ (void)showView:(UIView<SteAnimationObjDelegate>*)view inContainerView:(UIView*)conv WithAnimationObj:(id<SteAnimationViewDelegate>)obj {
    view.objDelegate = obj;
    obj.delegate = view;
    [view.objDelegate addAnimationShowView:view inContainterView:conv];
}

#pragma mark- LifeCicle

#pragma mark- CreateUI

#pragma mark- EventRespone

- (void)tapGestureAction:(UITapGestureRecognizer*)gesture {
//    if (self.objDelegate && [self.objDelegate respondsToSelector:@selector(removeAnimationShowView:inContainterView:)]) {
//        [self.objDelegate removeAnimationShowView:self inContainterView:self.superview];
//    }
}

#pragma mark- CustomDelegateMethod

#pragma mark- UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isEqual:self]) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark- GetterAndSetter

- (UIView*)baseView {
    if (!_baseView) {
        _baseView = [[UIView alloc]initWithFrame:CGRectZero];
        _baseView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer*  tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
        tapGesture.delegate = self;
        [_baseView addGestureRecognizer:tapGesture];
    }
    return _baseView;
}

#pragma mark- PrivateMethod



@end
