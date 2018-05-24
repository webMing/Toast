//
//  SteAnimationMaskView.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/17.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteAnimationMaskView.h"

@interface SteAnimationMaskView () <UIGestureRecognizerDelegate>

@end

@implementation SteAnimationMaskView

#pragma mark- LifeCicle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUi];
    }
    return self;
}

#pragma mark- CreateUI

- (void)setUpUi {
    [self setBackgroundColor:[UIColor clearColor]];
    UITapGestureRecognizer*  tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
    tapGesture.delegate = self;
    [self addGestureRecognizer:tapGesture];
}

#pragma mark- EventRespone

- (void)tapGestureAction:(UITapGestureRecognizer*)gesture {
    if (_delegate && [_delegate respondsToSelector:@selector(dissmissMaskView:)]) {
        [_delegate dissmissMaskView:self];
    }
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

#pragma mark- PrivateMethod

@end
