//
//  AnimationSuperView.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/17.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AnimationDelegate.h"

@interface AnimationSuperView : UIView <SteAnimationObjDelegate>

@property (weak, nonatomic) id<SteAnimationViewDelegate>objDelegate;

@end
