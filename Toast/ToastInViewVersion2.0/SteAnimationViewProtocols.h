//
//  SteAnimationViewDelegate.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/18.
//Copyright © 2018年 Stephanie. All rights reserved.
//

/*
 把AnimationObj绑定在animationView;考虑到AnimationObj是跟随animationView
 SteAnimationSuperView 提供外界调用接口,同时AOP maskView, AnimationObj 只做动画的事情
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SteAnimationViewObjDelegate;

@protocol SteAnimationViewDelegate <NSObject>

@required
@property (weak, nonatomic) id<SteAnimationViewObjDelegate>delegate;
- (void)steShowAnimationView:(UIView*)view inContainterView:(UIView*)cview;
- (void)steDissmissAnimationView:(UIView*)view inContainterView:(UIView*)cview;
@end

@protocol SteAnimationViewObjDelegate <NSObject>

@optional
- (void)steWillShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)steDidShowView:(UIView*)view inContainterView:(UIView*)cview;

- (void)steWillRemoveView:(UIView*)view fromContainView:(UIView*)conv;
- (void)steDidRemoveView:(UIView*)view fromContainView:(UIView*)conv;

@end
