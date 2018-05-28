//
//  SteSpringFromCentreViewController.m
//  LvTaotao
//
//  Created by XMYY-20 on 2018/5/15.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteBaseAnimationViewController.h"
#import "SteViewControllerAnimationSuperView.h"

#import <Masonry/Masonry.h>

@interface SteBaseAnimationViewController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIScrollView* scrollView;
@property (strong, nonatomic) UIView* scrollContentView;

@property (strong, nonatomic) UITapGestureRecognizer* tapGesture;

@property (strong, nonatomic) SteViewControllerAnimationSuperView<SteViewControllerAnimationObjDelegate>* animationView;
@property (strong, nonatomic) id<SteViewControllerAnimationViewDelegate> animationObj;
@end

/*
 benifit>
 1.如果自定义View中含有输入框,可以结合KeyBoard框架一起使用来避免因为键盘遮挡输入框的问题
 2.可以当做maskView的对象是animation.superView 或者是scrollView 因为动画结束动画需要对mask.backGroundColor进行处理.可以通过animationView 来获取maskView;
 */

/*
 1.实现功能的时候要考虑画中画的功能
 */

@implementation SteBaseAnimationViewController

#pragma mark- LifeCicle

+ (instancetype)loadWithInsetView:(SteViewControllerAnimationSuperView<SteViewControllerAnimationObjDelegate>*)view animationObj:(id<SteViewControllerAnimationViewDelegate>)obj {
    NSAssert(view != nil && obj != nil,@"Animation View And AnimationObj Must not nil");
    SteBaseAnimationViewController<SteViewControllerAnimationObjDelegate>* viewCtrl =  [[self alloc]init];
    if (viewCtrl) {
        view.delegate = obj;
        [obj addDelegate:view];
        //[obj addDelegate:viewCtrl];
        //obj.delegate = viewCtrl;
        viewCtrl.animationObj = obj;
        viewCtrl.animationView = view;
    }
    return viewCtrl;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.modalPresentationStyle  = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self addCustomView];
    [self layoutCustomView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![self.view.subviews containsObject:self.animationView] && [self.animationObj respondsToSelector:@selector(steWillShowAnimationView:inContainterView:)]) {
        [self.animationObj steWillShowAnimationView:self.animationView inContainterView:self.scrollContentView];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (![self.view.subviews containsObject:self.animationView] && [self.animationObj respondsToSelector:@selector(steShowAnimationView:inContainterView:)]) {
        [self.animationObj steShowAnimationView:self.animationView inContainterView:self.scrollContentView];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- SetUpView

- (void)setUpView {
    [self.scrollContentView addGestureRecognizer:self.tapGesture];
    self.view.backgroundColor = [UIColor clearColor];
    self.scrollContentView.backgroundColor = [[UIColor colorWithHex:0x050205]colorWithAlphaComponent:0.13];
}

- (void)addCustomView {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.scrollContentView];
    [self.scrollContentView addSubview:self.animationView];
}

- (void)layoutCustomView {
    
    if (@available(iOS 11.0, *)) {
        
        /* 这种方法也是可以的
         [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.insets = cvi.safeAreaInsets;
         }];
         */
        /* Masonry 系统提供的方法
         [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(cvi.mas_safeAreaLayoutGuideTop);
         make.bottom.equalTo(cvi.mas_safeAreaLayoutGuideBottom);
         make.left.equalTo(cvi.mas_safeAreaLayoutGuideLeft);
         make.right.equalTo(cvi.mas_safeAreaLayoutGuideRight);
         }];*/
        self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint* leading = [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor];
        NSLayoutConstraint*  trailing = [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor];
        NSLayoutConstraint* top = [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor];
        NSLayoutConstraint* bottom = [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor];
        [NSLayoutConstraint activateConstraints:@[leading,trailing,top,bottom]];
        
    } else {
        /*
         [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
         }];
         */
        //.topLayoutGuide.bottomAnchor  //UIViewController
        //.bottomLayoutGuide.topAnchor  //UIViewController
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint* leading = [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
        NSLayoutConstraint*  trailing = [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
        NSLayoutConstraint* top = [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor];
        NSLayoutConstraint* bottom = [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor];
        [NSLayoutConstraint activateConstraints:@[leading,trailing,top,bottom]];
        
    }
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        make.width.height.equalTo(self.scrollView);
    }];
}

#pragma mark- EventRespone

- (void)tapGetureAction {
    if (self.animationObj && [self.animationObj respondsToSelector:@selector(steDissmissAnimationView:inContainterView:)]) {
        [self.animationObj steDissmissAnimationView:self.animationView inContainterView:self.animationView.superview];
    }
}

/*
#pragma mark- SteViewControllerAnimationObjDelegate

- (void)steDidRemoveView:(UIView*)view fromContainView:(UIView*)conv {
    if (_delegate && [_delegate respondsToSelector:@selector(steBaseAnimationViewController:dissmissWithAnimationView:)]) {
        [_delegate steBaseAnimationViewController:self dissmissWithAnimationView:self.animationView];
    }
}
 */

#pragma mark- UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([gestureRecognizer.view isEqual:touch.view]) {
        return  YES;
    }else{
        return NO;
    }
}

#pragma mark- GetterAndSetter

- (UIScrollView*)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.scrollEnabled = NO; //scrollView
    }
    return _scrollView;
}

- (UIView*)scrollContentView {
    if (!_scrollContentView) {
        _scrollContentView = [[UIView alloc]initWithFrame:CGRectZero];
        _scrollContentView.backgroundColor = [UIColor clearColor];
    }
    return _scrollContentView;
}

- (UITapGestureRecognizer*)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGetureAction)];
        _tapGesture.delegate = self;
    }
    return _tapGesture;
}

- (void)setMaskViewBackGroundColor:(UIColor *)maskViewBackGroundColor {
    self.scrollContentView.backgroundColor = maskViewBackGroundColor;
}

- (UIColor*)maskViewBackGroundColor {
    return self.scrollContentView.backgroundColor;
}

- (void)setScrollEnable:(BOOL)scrollEnable {
    self.scrollView.scrollEnabled = scrollEnable;
}

- (BOOL)isScrollEnable {
    return self.scrollView.scrollEnabled;
}

- (void)setEnableMaskViewTapAction:(BOOL)enableMaskViewTapAction {
    self.tapGesture.enabled = enableMaskViewTapAction;
}

- (BOOL)isMaskViewTapActionAble {
    return self.tapGesture.enabled;
}

#pragma mark- PrivateMethod


@end
