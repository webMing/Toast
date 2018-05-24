//
//  SteAnimationMaskView.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/17.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SteAnimationMaskView;

@protocol SteAnimationMaskViewDelegate <NSObject>
- (void)dissmissMaskView:(SteAnimationMaskView*)view;
@end

@interface SteAnimationMaskView : UIView
@property (weak, nonatomic) id <SteAnimationMaskViewDelegate>delegate;
@end
