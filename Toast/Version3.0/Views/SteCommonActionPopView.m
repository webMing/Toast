//
//  SteCommonActionPopView.m
//  LvTaotao
//
//  Created by XMYY-20 on 2018/5/16.
//  Copyright © 2018年 Kerwin. All rights reserved.
//

#import "SteCommonActionPopView.h"

@protocol SteCommonDismissSelfDelegate <NSObject>
- (void)dismissSelfWithBlock:(void(^)(void))block;
@end

@interface SteCommonActionPopView()
@property (weak, nonatomic) id<SteCommonDismissSelfDelegate> delegate;
@end

@implementation SteCommonActionPopView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)dimissSelfWithType:(SteAtionViewAtionType) type{
    if (_delegate && [_delegate respondsToSelector:@selector(dismissSelfWithBlock:)]) {
        __weak typeof(self) weakSelf = self;
        [_delegate dismissSelfWithBlock:^{
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(actionView:dissmissWithType:)]) {
                 [weakSelf.otherDelegate  actionView:weakSelf dissmissWithType:type];
            }
           
        }];
    }
}
@end
