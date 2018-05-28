# Toast
依赖View ,ViewController 自定义弹出框

#import "SteBaseAnimationViewController.h"
#import "SteViewControllerSpringAnimationViewObj.h"
#import "SteCommonSingleTitleAndDoubleActionView.h"

#import "SteCommonFromBottomUpView.h"
#import "SteCommonFromBottomUpViewObj.h"

```
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
```
