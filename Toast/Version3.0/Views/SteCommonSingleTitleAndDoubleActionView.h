//
//  SteCommonSingleTitleAndDoubleActionView.h
//  LvTaotao
//
//  Created by XMYY-20 on 2018/5/16.
//  Copyright © 2018年 Kerwin. All rights reserved.
//

#import "SteCommonActionPopView.h"

@interface SteCommonSingleTitleAndDoubleActionView : SteCommonActionPopView
@property (strong, nonatomic) UIButton *leftActionBtn; //不要使用TargetAction
@property (strong, nonatomic) UIButton *rightActionBtn; //不要使用TargetAction
@property (strong, nonatomic) UILabel *titleLb;
@end
