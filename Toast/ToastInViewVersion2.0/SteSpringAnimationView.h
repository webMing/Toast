//
//  SteSpringAnimationView.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/20.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteAnimationSuperView.h"

@class SteSpringAnimationView;

@protocol SteSpringAnimationViewDelegate <NSObject>
- (void)springAnimationViewConfirmWithView:(SteSpringAnimationView*)view;
- (void)springAnimationViewCancelWithView:(SteSpringAnimationView*)view;
@end

@interface SteSpringAnimationView : SteAnimationSuperView

@property (strong, readonly , nonatomic) UILabel* titleLb;
@property (strong, readonly , nonatomic) UILabel* confirmLb;
@property (strong, readonly , nonatomic) UILabel* cancelLb;
@property (weak  , nonatomic) id <SteSpringAnimationViewDelegate> delegate;

@end
