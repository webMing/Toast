//
//  SteSpringFromCentreViewController.h
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SteViewControllerAnimationProtocols.h"

@class SteViewControllerAnimationSuperView,SteBaseAnimationViewController;

@protocol SteBaseAnimationViewControllerDelegate <NSObject>
- (void)steBaseAnimationViewController:(SteBaseAnimationViewController*)ctrl dissmissWithAnimationView:(SteViewControllerAnimationSuperView<SteViewControllerAnimationObjDelegate>*)animationView;
@end

@interface SteBaseAnimationViewController : UIViewController

+ (instancetype)loadWithInsetView:(SteViewControllerAnimationSuperView<SteViewControllerAnimationObjDelegate>*)view animationObj:(id<SteViewControllerAnimationViewDelegate>)obj;

@property (nonatomic, weak) id<SteBaseAnimationViewControllerDelegate>delegate;
//@property(nonatomic,strong,class) UIColor* maskViewBackGrondColor;

@property(nonatomic,strong) UIColor* maskViewBackGroundColor;
@property(nonatomic, assign,getter=isMaskViewTapActionAble) BOOL enableMaskViewTapAction;

@end
