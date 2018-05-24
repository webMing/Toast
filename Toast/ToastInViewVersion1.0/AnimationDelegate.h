//
//  AnimationDelegate.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/15.
//Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AnimationSuperView;
@protocol SteAnimationViewDelegate;

@protocol SteAnimationObjDelegate <NSObject>

@required

@property (weak, nonatomic) id<SteAnimationViewDelegate>objDelegate;

@optional

- (void)willShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)didShowView:(UIView*)view inContainterView:(UIView*)cview;

- (void)willRemoveView:(UIView*)view fromContainView:(UIView*)conv;
- (void)didRemoveView:(UIView*)view fromContainView:(UIView*)conv;

@end

@protocol SteAnimationViewDelegate <NSObject>

@required

@property (weak, nonatomic) id<SteAnimationObjDelegate>delegate;
- (void)addAnimationShowView:(AnimationSuperView*)view inContainterView:(UIView*)cView;
- (void)removeAnimationShowView:(UIView*)view inContainterView:(UIView*)cView;

@optional

@end
