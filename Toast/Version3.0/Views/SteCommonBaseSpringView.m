//
//  SteCommonActionPopView.m
//
//  Created by Stephanie on 2018/5/16.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteCommonBaseSpringView.h"
#import <Masonry.h>

@interface SteCommonBaseSpringView()

@end

@implementation SteCommonBaseSpringView

#pragma mark- LifeCicle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        /*注意这里写superSetUpViews,因为这几个接口没有公开,所以子类无法继承*/
        [self superSetUpViews];
        [self superAddCustomViews];
        [self superLayoutCustomViews];
    }
    return self;
}

- (void)didMoveToSuperview {
    if (self.superview) {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
            //make.width.mas_equalTo(screenWidth * 0.7);
            make.width.equalTo(@(screenWidth * 0.7));
            //make.height.equalTo(self.mas_width).multipliedBy(0.54);
            make.center.equalTo(self.superview);
        }];
    }
}

#pragma mark- SetUpView

- (void)superSetUpViews {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)superAddCustomViews{
    
}

- (void)superLayoutCustomViews {
    
}

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

@end
