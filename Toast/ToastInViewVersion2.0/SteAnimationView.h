//
//  SteAnimationView.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/18.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteAnimationSuperView.h"

@class SteAnimationView;

@protocol SteAnimationViewExternDelegate <NSObject>
- (void)cancelWithanimationView:(SteAnimationView*)view;
- (void)confirmWithanimationView:(SteAnimationView*)view;
@end

@interface SteAnimationView : SteAnimationSuperView
@property (strong, readonly , nonatomic) UILabel* confirmLb;
@property (strong, readonly , nonatomic) UILabel* cancelLb;
@property (weak  , nonatomic) id <SteAnimationViewExternDelegate> delegate;
@end
