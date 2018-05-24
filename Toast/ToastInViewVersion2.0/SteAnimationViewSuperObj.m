//
//  SteAnimationViewSuperObj.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/18.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteAnimationViewSuperObj.h"

/*Class 'SteAnimationViewSuperObj' does not conform to protocol 'SteAnimationViewDelegate 因为没有实现协议方法才出现的警告*/
@implementation SteAnimationViewSuperObj

- (void)ste_willShowView:(UIView*)view inContainterView:(UIView*)cview {
    if (_delegate && [_delegate respondsToSelector:@selector(steWillShowView:inContainterView:)]) {
        [_delegate steWillShowView:view inContainterView:cview];
    }
}

- (void)ste_didShowView:(UIView*)view inContainterView:(UIView*)cview {
    if (_delegate && [_delegate respondsToSelector:@selector(steDidShowView:inContainterView:)]) {
        [_delegate steDidShowView:view inContainterView:cview];
    }
}

- (void)ste_willRemoveView:(UIView*)view fromContainView:(UIView*)conv {
    if (_delegate && [_delegate respondsToSelector:@selector(steWillRemoveView:fromContainView:)]) {
        [_delegate steWillRemoveView:view fromContainView:conv];
    }
}

- (void)ste_didRemoveView:(UIView*)view fromContainView:(UIView*)conv {
    if (_delegate && [_delegate respondsToSelector:@selector(steDidRemoveView:fromContainView:)]) {
        [_delegate steDidRemoveView:view fromContainView:conv];
    }
}
@end
