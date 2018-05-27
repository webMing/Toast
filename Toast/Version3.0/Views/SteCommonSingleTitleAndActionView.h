//
//  SteCommonSingleTitleAndActionView.h
//
//  Created by Stephanie on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteViewControllerAnimationSuperView.h"

@interface SteCommonSingleTitleAndActionView : SteViewControllerAnimationSuperView
@property (strong, nonatomic) UIButton *actionBtn; //不要使用TargetAction
@property (strong, nonatomic) UILabel *titleLb;
@end
