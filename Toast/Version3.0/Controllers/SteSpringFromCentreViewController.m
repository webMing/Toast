//
//  SteSpringFromCentreViewController.m
//  LvTaotao
//
//  Created by XMYY-20 on 2018/5/15.
//  Copyright © 2018年 Kerwin. All rights reserved.
//

#import "SteSpringFromCentreViewController.h"
#import <Masonry/Masonry.h>

@interface SteSpringFromCentreViewController ()
@property (strong, nonatomic)  UIView *bottomView;
@property (strong, nonatomic)  UIView *contentView;

@property (strong, nonatomic) UIScrollView* scrollView;
@property (strong, nonatomic) UIView* scrollContentView;
@property (strong, nonatomic) UIView* swapView;

@end

@implementation SteSpringFromCentreViewController

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//         self.modalPresentationStyle  = UIModalPresentationOverFullScreen;
//    }
//    return self;
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.modalPresentationStyle  = UIModalPresentationOverFullScreen;
    }
    return self;
}

+ (instancetype)loadWithInsetView:(UIView*)view {
    SteSpringFromCentreViewController* vc =  [[self alloc]init];
    [view setValue:vc forKey:@"delegate"];
    vc.swapView = view;
    return vc;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.modalPresentationStyle  = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cAddSubViews];
    [self clayOutSubViews];
    [self setUpUI]; //需要放在最后o
}

- (void)setUpUI {
    self.view.backgroundColor = [[UIColor colorWithHex:0x050205]colorWithAlphaComponent:0.13];
    CGAffineTransform trans = CGAffineTransformScale(_bottomView.transform, 0.001, 0.001);
    _bottomView.transform = trans;  // do it instantly, no animation
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        _bottomView.transform = CGAffineTransformScale(_bottomView.transform, 1000.0f, 1000.0f);
    } completion:^(BOOL finished) {
      
    }];
}

- (void)dismissSelfWithBlock:(void(^)(void))block {
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
        _bottomView.transform = CGAffineTransformScale(_bottomView.transform, 0.001f, 0.001f);
        _bottomView.alpha = 0.3f;
        self.view.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        if (finished) {
            [self.presentingViewController dismissViewControllerAnimated:NO completion:^{
                if (block) {
                    block();
                }
            }];
        }
    }];
    
}

#pragma mark- LifeCicle

#pragma mark- CreateUI

- (void)cAddSubViews {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.scrollContentView];
    [self.scrollContentView addSubview:self.bottomView];
    [self.bottomView addSubview:self.swapView];
}

- (void)clayOutSubViews {
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        make.width.height.equalTo(self.scrollView);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.scrollContentView);
        make.width.equalTo(self.scrollContentView).multipliedBy(0.7);//这里不能是分数形式
    }];
    if (!self.swapView) return;
    NSAssert(self.swapView != nil, @"self.swap is not nil!");
    //if (!self.swapView) return;
    [self.swapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
}

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

- (UIView*)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectZero];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.layer.cornerRadius = 6.0f;
        _bottomView.layer.masksToBounds = YES;
    }
    return _bottomView;
}

- (UIView*)contentView {
    if (!_contentView) {
        _contentView =  [[UIView alloc]initWithFrame:CGRectZero];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

- (UIView*)scrollContentView {
    if (!_scrollContentView) {
        _scrollContentView = [[UIView alloc]initWithFrame:CGRectZero];
        _scrollContentView.backgroundColor = [UIColor clearColor];
    }
    return _scrollContentView;
}

- (UIScrollView*)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _scrollView.backgroundColor = [UIColor clearColor];
    }
    return _scrollView;
}

#pragma mark- PrivateMethod
/*
 + (UIColor *)colorWithHexString:(NSString *)hexString {
 CGFloat alpha, red, blue, green;
 
 NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
 switch ([colorString length]) {
 case 3: // #RGB
 alpha = 1.0f;
 red   = colorComponentFrom(colorString, 0, 1);
 green = colorComponentFrom(colorString, 1, 1);
 blue  = colorComponentFrom(colorString, 2, 1);
 break;
 
 case 4: // #ARGB
 alpha = colorComponentFrom(colorString, 0, 1);
 red   = colorComponentFrom(colorString, 1, 1);
 green = colorComponentFrom(colorString, 2, 1);
 blue  = colorComponentFrom(colorString, 3, 1);
 break;
 
 case 6: // #RRGGBB
 alpha = 1.0f;
 red   = colorComponentFrom(colorString, 0, 2);
 green = colorComponentFrom(colorString, 2, 2);
 blue  = colorComponentFrom(colorString, 4, 2);
 break;
 
 case 8: // #AARRGGBB
 alpha = colorComponentFrom(colorString, 0, 2);
 red   = colorComponentFrom(colorString, 2, 2);
 green = colorComponentFrom(colorString, 4, 2);
 blue  = colorComponentFrom(colorString, 6, 2);
 break;
 
 default:
 return nil;
 }
 return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
 }
 */

@end
