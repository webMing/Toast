//
//  SteViewControllerAnimationSuperView.m
//  Toast
//
//  Created by Stephanie on 2018/5/26.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteViewControllerAnimationSuperView.h"
#import <Masonry.h>

@interface SteViewControllerAnimationSuperView()

@end

@implementation SteViewControllerAnimationSuperView

#pragma mark- LifeCicle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpViews];
        [self addCustomViews];
        [self layoutCustomViews];
    }
    return self;
}

- (void)didMoveToSuperview {
    if (self.superview) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            //将来要把这个定义迁移出来.
            CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
            //make.width.mas_equalTo(screenWidth * 0.7);
            make.width.equalTo(@(screenWidth * 0.7));
            make.height.equalTo(self.mas_width).multipliedBy(0.54);
            make.center.equalTo(self.superview);
        }];
    }
}

#pragma mark- SetUpView

- (void)setUpViews {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)addCustomViews {
   
}

- (void)layoutCustomViews {
    
}

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod


@end
