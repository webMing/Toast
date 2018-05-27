//
//  SteViewControllerAnimationSuperObj.h
//  Toast
//
//  Created by Stephanie on 2018/5/26.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SteViewControllerAnimationProtocols.h"

@interface SteViewControllerAnimationSuperObj:NSObject <SteViewControllerAnimationViewDelegate>
//@property (weak, nonatomic) id<SteViewControllerAnimationObjDelegate>delegate;
- (void)ste_willShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)ste_didShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)ste_willRemoveView:(UIView*)view fromContainView:(UIView*)conv;
- (void)ste_didRemoveView:(UIView*)view fromContainView:(UIView*)conv;

@end
