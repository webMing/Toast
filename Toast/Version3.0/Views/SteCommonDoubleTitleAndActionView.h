//
//  SteCommonDoubleTitleAndActionView.h
//  LvTaotao
//
//  Created by XMYY-20 on 2018/5/16.
//  Copyright © 2018年 Kerwin. All rights reserved.
//

#import "SteCommonActionPopView.h"

/*-----这里视图的继承: SteCommonActionPopView----*/
@interface SteCommonDoubleTitleAndActionView : SteCommonActionPopView
@property (strong, nonatomic) UIButton *actionBtn; //不要使用TargetAction
@property (strong, nonatomic) UILabel *largeTitleLb; //大标题
@property (strong, nonatomic) UILabel *titleLb; //小标题

@end
