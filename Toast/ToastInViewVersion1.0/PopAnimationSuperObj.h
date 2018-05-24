//
//  PopAnimationSuperObj.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationDelegate.h"

@interface PopAnimationSuperObj : NSObject<SteAnimationViewDelegate>

@property (weak, nonatomic) id<SteAnimationObjDelegate>delegate;

- (void)aniObj_willShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)aniObj_didShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)aniObj_willRemoveView:(UIView*)view FromContainterView:(UIView*)cview;
- (void)aniObj_didRemoveView:(UIView*)view FromContainterView:(UIView*)cview;

@end
