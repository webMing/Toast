//
//  SteAnimationViewSuperObj.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/18.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SteAnimationViewDelegate.h"

@interface SteAnimationViewSuperObj : NSObject <SteAnimationViewDelegate>
@property (weak, nonatomic) id<SteAnimationViewObjDelegate>delegate;

- (void)ste_willShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)ste_didShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)ste_willRemoveView:(UIView*)view fromContainView:(UIView*)conv;
- (void)ste_didRemoveView:(UIView*)view fromContainView:(UIView*)conv;

@end
