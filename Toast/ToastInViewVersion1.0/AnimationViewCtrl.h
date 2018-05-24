//
//  AnimationViewCtrl.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"

@interface AnimationViewCtrl : NSObject
+ (void)showView:(UIView<SteAnimationObjDelegate>*)view inContainerView:(UIView*)conv WithAnimationObj:(id<SteAnimationViewDelegate>)obj ;
@end
