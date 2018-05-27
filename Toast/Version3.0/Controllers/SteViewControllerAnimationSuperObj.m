//
//  SteViewControllerAnimationSuperObj.m
//  Toast
//
//  Created by Stephanie on 2018/5/26.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteViewControllerAnimationSuperObj.h"

#define LOCK(lock) dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
#define UNLOCK(lock) dispatch_semaphore_signal(lock);

@interface SteViewControllerAnimationSuperObj()
@property (strong, nonatomic) NSPointerArray* weakPointArray;
@property (nonatomic, strong, nonnull) NSMutableArray* weakMutArray;
@property (nonatomic, strong, nonnull) dispatch_semaphore_t weakCacheLock;

@end

@implementation SteViewControllerAnimationSuperObj

// 重写这两个方法避免警告出现
- (void)steDissmissAnimationView:(UIView *)view inContainterView:(UIView *)cview {
    @throw [NSException exceptionWithName:NSGenericException reason:[NSString stringWithFormat:@"Sub Class Must Implementation %@",NSStringFromSelector(@selector(steDissmissAnimationView:inContainterView:))] userInfo:nil];
}

- (void)steShowAnimationView:(UIView *)view inContainterView:(UIView *)cview {
     @throw [NSException exceptionWithName:NSGenericException reason:[NSString stringWithFormat:@"Sub Class Must Implementation %@",NSStringFromSelector(@selector(steShowAnimationView:inContainterView:))] userInfo:nil];
}

/*
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
*/


- (void)ste_willShowView:(UIView*)view inContainterView:(UIView*)cview {
    [self.weakMutArray enumerateObjectsUsingBlock:^(NSValue* value, NSUInteger idx, BOOL * _Nonnull stop) {
        id<SteViewControllerAnimationObjDelegate> delegate = [value nonretainedObjectValue];
        if (delegate && [delegate respondsToSelector:@selector(steWillShowView:inContainterView:)]) {
            [delegate steWillShowView:view inContainterView:cview];
        }
    }];
}

- (void)ste_didShowView:(UIView*)view inContainterView:(UIView*)cview {
    [self.weakMutArray enumerateObjectsUsingBlock:^(NSValue* value, NSUInteger idx, BOOL * _Nonnull stop) {
        id<SteViewControllerAnimationObjDelegate> delegate = [value nonretainedObjectValue];
        if (delegate && [delegate respondsToSelector:@selector(steDidShowView:inContainterView:)]) {
            [delegate steDidShowView:view inContainterView:cview];
        }
    }];
}

- (void)ste_willRemoveView:(UIView*)view fromContainView:(UIView*)conv {
    [self.weakMutArray enumerateObjectsUsingBlock:^(NSValue* value, NSUInteger idx, BOOL * _Nonnull stop) {
        id<SteViewControllerAnimationObjDelegate> delegate = [value nonretainedObjectValue];
        if (delegate && [delegate respondsToSelector:@selector(steWillRemoveView:fromContainView:)]) {
            [delegate steWillRemoveView:view fromContainView:conv];
        }
    }];
}

- (void)ste_didRemoveView:(UIView*)view fromContainView:(UIView*)conv {
    [self.weakMutArray enumerateObjectsUsingBlock:^(NSValue* value, NSUInteger idx, BOOL * _Nonnull stop) {
        id<SteViewControllerAnimationObjDelegate> delegate = [value nonretainedObjectValue];
        if (delegate && [delegate respondsToSelector:@selector(steDidRemoveView:fromContainView:)]) {
            [delegate steDidRemoveView:view fromContainView:conv];
        }
    }];
}

- (void)addDelegate:(id<SteViewControllerAnimationObjDelegate>)delegate {
    LOCK(self.weakCacheLock);
    [self.weakMutArray addObject:[NSValue valueWithNonretainedObject:delegate]];
    UNLOCK(self.weakCacheLock);
}

- (NSMutableArray*)weakMutArray {
    if (!_weakMutArray) {
        _weakMutArray = NSMutableArray.new;
    }
    return _weakMutArray;
}

- (dispatch_semaphore_t)weakCacheLock {
    if (!_weakCacheLock) {
        _weakCacheLock = dispatch_semaphore_create(1);
    }
    return _weakCacheLock;
}


@end
