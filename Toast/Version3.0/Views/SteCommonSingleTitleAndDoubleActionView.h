//
//  SteCommonSingleTitleAndDoubleActionView.h
//
//  Created by Stephanie on 2018/5/16.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteViewControllerAnimationSuperView.h"

@interface SteCommonSingleTitleAndDoubleActionView : SteViewControllerAnimationSuperView
@property (strong, nonatomic) UIButton *leftActionBtn; //不要使用TargetAction
@property (strong, nonatomic) UIButton *rightActionBtn; //不要使用TargetAction
@property (strong, nonatomic) UILabel *titleLb;
@end
