//
//  ViewController.m
//  Toast
//
//  Created by Stephanie on 2018/5/22.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "ViewController.h"

#import "SteSpringAnimationView.h"
#import "SteSpringAnimationViewObj.h"

#import "SteAnimationView.h"
#import "SteAnimationViewObj.h"

#import "SteSpringFromCentreViewController.h"
#import "SteCommonSingleTitleAndDoubleActionView.h"

@interface ViewController ()
/** ActionBtn */
@property (strong, nonatomic) UILabel *nameLb;

@end

@implementation ViewController


#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self addCustomView];
    [self layoutCustomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- SetUpView

- (void)setUpView {
    
}

- (void)addCustomView {
    
}

- (void)layoutCustomView {
    
}

#pragma mark- EventRespone

- (IBAction)showToast:(id)sender {
    [self toastType3];
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

- (void)toastType3 {
     SteCommonSingleTitleAndDoubleActionView* view = [[SteCommonSingleTitleAndDoubleActionView alloc]init];
    SteSpringFromCentreViewController* controller = [SteSpringFromCentreViewController loadWithInsetView:view];
    [self presentViewController:controller animated:NO completion:nil];
}

- (void)toastType2 {
    SteSpringAnimationView* view = [[SteSpringAnimationView alloc]initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    SteSpringAnimationViewObj* obj = [[SteSpringAnimationViewObj alloc]init];
    [view showInContainView:self.view withAnimationObj:obj];
}
- (void)toastType1 {
    //这里强引用有问题哦.
//     SteAnimationView* view = [[SteAnimationView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200)];
//     SteAnimationViewObj* obj = [[SteAnimationViewObj alloc]init];
//     [view showInContainView:self.view withAnimationObj:obj];
}

/*
- (UILabel*)nameLb {
    if (!_nameLb) {
        _nameLb = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLb.text = <#text#>;
        _nameLb.font = <#font#>;
        _nameLb.numberOfLines = 0;
        _nameLb.textColor = [UIColor whiteColor];
        _nameLb.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLb;
}
*/


@end
