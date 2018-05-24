//
//  PopAnimationSuperObj.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "PopAnimationSuperObj.h"

@implementation PopAnimationSuperObj

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)aniObj_willShowView:(UIView *)view inContainterView:(UIView *)cview {
    if (_delegate && [_delegate respondsToSelector:@selector(willShowView: inContainterView:)] ) {
        [_delegate willShowView:view inContainterView:view];
    }
}

- (void)aniObj_didShowView:(UIView *)view inContainterView:(UIView *)cview {
    if (_delegate && [_delegate respondsToSelector:@selector(didShowView:inContainterView:)] ) {
        [_delegate didShowView:view inContainterView:cview];
    }
}

- (void)aniObj_willRemoveView:(UIView *)view FromContainterView:(UIView *)cview {
    if (_delegate && [_delegate respondsToSelector:@selector(willRemoveView:fromContainView:)] ) {
        [_delegate willRemoveView:view fromContainView:cview];
    }
}

- (void)aniObj_didRemoveView:(UIView *)view FromContainterView:(UIView *)cview {
    if (_delegate && [_delegate respondsToSelector:@selector(didRemoveView:fromContainView:)] ) {
        [_delegate didRemoveView:view fromContainView:cview];
    }
}

- (void)addAnimationShowView:(UIView *)view inContainterView:(UIView *)cView {
   @throw [NSException exceptionWithName:NSGenericException reason:@"animationView代理方法 这个方法子类需要实现,这里写了防止出现的警告" userInfo:nil];
}

- (void)removeAnimationShowView:(UIView *)view inContainterView:(UIView *)cView {
    @throw [NSException exceptionWithName:NSGenericException reason:@"animationView代理方法 这个方法子类需要实现,这里写了防止出现的警告" userInfo:nil];
}

@end
