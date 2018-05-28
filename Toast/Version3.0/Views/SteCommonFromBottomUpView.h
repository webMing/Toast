//
//  SteCommonFromBottomUpView.h
//  Toast
//
//  Created by Stephanie on 2018/5/27.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteViewControllerAnimationSuperView.h"

@class SteCommonFromBottomUpView;
@protocol SteCommonFromBottomUpViewDelegate <NSObject>
- (void)SteCommonFromBottomUpViewCancel:(SteCommonFromBottomUpView*)view;
- (void)SteCommonFromBottomUpViewConfirm:(SteCommonFromBottomUpView*)view;
@end

@interface SteCommonFromBottomUpView : SteViewControllerAnimationSuperView
@property (weak, nonatomic) id<SteCommonFromBottomUpViewDelegate>externDelegate;
@end
