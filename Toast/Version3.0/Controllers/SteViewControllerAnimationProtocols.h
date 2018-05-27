//
//  SteViewControllerAnimationProtocols.h
//  Toast
//
//  Created by Stephanie on 2018/5/26.
//Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SteViewControllerAnimationObjDelegate;

@protocol SteViewControllerAnimationViewDelegate <NSObject>
@required
//@property (weak, nonatomic) id<SteViewControllerAnimationObjDelegate>delegate;
- (void)addDelegate:(id<SteViewControllerAnimationObjDelegate>)delegate;
- (void)steShowAnimationView:(UIView*)view inContainterView:(UIView*)cview;
- (void)steDissmissAnimationView:(UIView*)view inContainterView:(UIView*)cview;
@end

@protocol SteViewControllerAnimationObjDelegate <NSObject>

@optional
- (void)steWillShowView:(UIView*)view inContainterView:(UIView*)cview;
- (void)steDidShowView:(UIView*)view inContainterView:(UIView*)cview;

- (void)steWillRemoveView:(UIView*)view fromContainView:(UIView*)conv;
- (void)steDidRemoveView:(UIView*)view fromContainView:(UIView*)conv;

@end
