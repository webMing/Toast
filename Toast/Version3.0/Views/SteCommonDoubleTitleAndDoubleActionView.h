//
//  SteCommonDoubleTitleAndDoubleActionView.h
//
//  Created by Stephanie on 2018/5/16.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteViewControllerAnimationSuperView.h"

@interface SteCommonDoubleTitleAndDoubleActionView : SteViewControllerAnimationSuperView
@property (strong, nonatomic) UILabel *largeTitleLb; //大标题
@property (strong, nonatomic) UILabel *titleLb; //小标题
@property (strong, nonatomic) UIButton *leftActionBtn; //不要使用TargetAction
@property (strong, nonatomic) UIButton *rightActionBtn; //不要使用TargetAction
@end
