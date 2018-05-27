//
//  SteCommonDoubleTitleAndActionView.h
//
//  Created by Stephanie on 2018/5/16.
//  Copyright © 2018年 Stephanie All rights reserved.
//

#import "SteViewControllerAnimationSuperView.h"

@interface SteCommonDoubleTitleAndActionView : SteViewControllerAnimationSuperView
@property (strong, nonatomic) UIButton *actionBtn; //不要使用TargetAction
@property (strong, nonatomic) UILabel *largeTitleLb; //大标题
@property (strong, nonatomic) UILabel *titleLb; //小标题

@end
