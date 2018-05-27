//
//  SteViewControllerAnimationSuperView.h
//  Toast
//
//  Created by Stephanie on 2018/5/26.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SteViewControllerAnimationProtocols.h"
@interface SteViewControllerAnimationSuperView : UIView <SteViewControllerAnimationObjDelegate>
@property (nonatomic, weak) id<SteViewControllerAnimationViewDelegate>delegate;
@end
