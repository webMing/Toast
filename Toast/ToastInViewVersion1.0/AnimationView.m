//
//  AnimationView.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "AnimationView.h"

@interface AnimationView()
@property (nonatomic, strong) UIButton* actionBtn;
@end

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    self.backgroundColor = [UIColor redColor];
    [self addSubview:self.actionBtn];
}

- (UIButton*)actionBtn {
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        CGRect rect = CGRectZero;
        rect.size = CGSizeMake(200, 55);
        _actionBtn.frame = rect;
        _actionBtn.center = self.center;
        [_actionBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_actionBtn addTarget:self action:@selector(dimissSelf) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
}

- (void)dimissSelf {
    if (self.objDelegate && [self.objDelegate respondsToSelector:@selector(removeAnimationShowView:inContainterView:)]) {
        [self.objDelegate removeAnimationShowView:self inContainterView:self.superview];
    }
}

- (void)didRemoveView:(UIView *)view fromContainView:(UIView *)conv {
     NSLog(@"%s",__FUNCTION__);
}

- (void)didShowView:(UIView *)view inContainterView:(UIView *)cview {
     NSLog(@"%s",__FUNCTION__);
}

- (void)willRemoveView:(UIView *)view fromContainView:(UIView *)conv {
    NSLog(@"%s",__FUNCTION__);
}

- (void)willShowView:(UIView *)view inContainterView:(UIView *)cview {
    NSLog(@"%s",__FUNCTION__);
}



@end
