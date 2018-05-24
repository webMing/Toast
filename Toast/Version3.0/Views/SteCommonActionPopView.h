//
//  SteCommonActionPopView.h
//  LvTaotao
//
//  Created by XMYY-20 on 2018/5/16.
//  Copyright © 2018年 Kerwin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SteAtionViewAtionType) {
    SteAtionViewCommonAtionType,
    SteAtionViewLeffAtionType,
    SteAtionViewRightAtionType,
};

@protocol SteAnimationObjDelegate <NSObject>
- (void)beginAnimation;
- (void)endAnimation;
@end

@protocol SteActionViewDidDimissDelegate <NSObject>
@optional
//- (void)commonActionTriggerDissmissView:(UIView*)view;
//- (void)rightActionTriggerDissmissView:(UIView*)view;
//- (void)leftActionTriggerDissmissView:(UIView*)view;
- (void)actionView:(UIView*)actionView dissmissWithType:(SteAtionViewAtionType)type;
@end

@interface SteCommonActionPopView : UIView
@property (weak, nonatomic) id<SteActionViewDidDimissDelegate> otherDelegate;
@property (strong, nonatomic) id<SteAnimationObjDelegate>animationObj;
- (void)dimissSelfWithType:(SteAtionViewAtionType)type;
@end
