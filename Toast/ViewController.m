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

#import "SteBaseAnimationViewController.h"
#import "SteViewControllerSpringAnimationViewObj.h"
#import "SteCommonSingleTitleAndDoubleActionView.h"


#import "SteCommonFromBottomUpView.h"
#import "SteCommonFromBottomUpViewObj.h"

@interface ViewController ()<SteCommonBaseSpringViewDelegate, SteCommonFromBottomUpViewDelegate>
/** ActionBtn */
@property (strong, nonatomic) UILabel *nameLb;

@property (strong, nonatomic) NSPointerArray* weakPointerArray;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}
#pragma mark- SetUpView

- (void)setUpView {
    self.automaticallyAdjustsScrollViewInsets
}

- (void)addCustomView {
    
}

- (void)layoutCustomView {
    
}

#pragma mark- EventRespone

- (IBAction)showToast:(id)sender {
    [self toastType3];
}

#pragma mark- SteCommonBaseSpringViewDelegate

- (void)steCommonBaseSpringView:(SteCommonBaseSpringView*)view withActionType:(SteCommonBaseSpringViewActionType)type {
    NSLog(@"====type:%lu",(unsigned long)type);
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark- SteCommonFromBottomUpViewDelegate
- (void)SteCommonFromBottomUpViewCancel:(SteCommonFromBottomUpView*)view {
    NSLog(@"%@ Cancel Action!",view);
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)SteCommonFromBottomUpViewConfirm:(SteCommonFromBottomUpView*)view {
    NSLog(@"%@ Confirm Action!",view);
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

- (void)toastType4 {
    SteCommonFromBottomUpViewObj* animationObj = [[SteCommonFromBottomUpViewObj alloc]init];
    SteCommonFromBottomUpView* view = [[SteCommonFromBottomUpView alloc]init];
    view.externDelegate = self;
    SteBaseAnimationViewController* ctrl = [SteBaseAnimationViewController loadWithInsetView:view animationObj:animationObj];
    [self presentViewController:ctrl animated:NO completion:nil];
}


- (void)toastType3 {
    SteViewControllerSpringAnimationViewObj* animationObj = [[SteViewControllerSpringAnimationViewObj alloc]init];
    SteCommonSingleTitleAndDoubleActionView* view = [[SteCommonSingleTitleAndDoubleActionView alloc]init];
    view.externDelegate = self;
    SteBaseAnimationViewController* ctrl = [SteBaseAnimationViewController loadWithInsetView:view animationObj:animationObj];
    //ctrl.enableMaskViewTapAction = NO;
    //ctrl.scrollEnable = YES;
    [self presentViewController:ctrl animated:NO completion:nil];
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

/*
 //初始化一个弱引用数组对象
 _weakPointerArray = [NSPointerArray weakObjectsPointerArray];
 for(int i=0;i<10;i++){
 NSObject *obj = [NSObject new];
 //往数组中添加对象
 [_weakPointerArray addPointer:(__bridge void * _Nullable)(obj)];
 }
 //输出数组中的所有对象,如果没有对象会输出一个空数组
 NSArray *array = [_weakPointerArray allObjects];
 NSLog(@"%@",array);
 
 id test = [_weakPointerArray pointerAtIndex:0];
 [test description];
 //输出数组中的元素个数,包括NULL
 NSLog(@"%zd",_weakPointerArray.count);//此时输出:10,因为NSObject在for循环之后就被释放了
 //先数组中添加一个NULL
 [_weakPointerArray addPointer:NULL];
 NSLog(@"%zd",_weakPointerArray.count);//输出:11
 //清空数组中的所有NULL,注意:经过测试如果直接compact是无法清空NULL,需要在compact之前,调用一次[_weakPointerArray addPointer:NULL],才可以清空
 [_weakPointerArray compact];
 NSLog(@"%zd",_weakPointerArray.count);//输出:0
 //注意:如果直接往_weakPointerArray中添加对象,那么addPointer方法执行完毕之后,NSObject会直接被释放掉
 [_weakPointerArray addPointer:(__bridge void * _Nullable)([NSObject new])];
 NSLog(@"%@",[_weakPointerArray allObjects]);//输出:空数组 NSPointArray[7633:454561] ()
 //应该这样添加对象
 NSObject *obj = [NSObject new];
 [_weakPointerArray addPointer:(__bridge void * _Nullable)obj];
 NSLog(@"%@",[_weakPointerArray allObjects]);//输出:NSPointArray[7633:454561] ("<NSObject: 0x6000000078c0>")
 
 */

@end
