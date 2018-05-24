//
//  SteAnimationSuperView.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/17.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SteAnimationViewDelegate.h"

@interface SteAnimationSuperView : UIView <SteAnimationViewObjDelegate>
@property (strong, nonatomic) id<SteAnimationViewDelegate>aniObj;
- (void)showInContainView:(UIView*)cvi withAnimationObj:(id<SteAnimationViewDelegate>)obj;
@end
