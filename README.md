## Toast ##
依赖View ,ViewController 自定义弹出框

#import "SteBaseAnimationViewController.h"  
#import "SteViewControllerSpringAnimationViewObj.h"  
#import "SteCommonSingleTitleAndDoubleActionView.h"  

#import "SteCommonFromBottomUpView.h"  
#import "SteCommonFromBottomUpViewObj.h"  

### UseType1
```
- (void)toastType4 {
    SteCommonFromBottomUpViewObj* animationObj = [[SteCommonFromBottomUpViewObj alloc]init];
    SteCommonFromBottomUpView* view = [[SteCommonFromBottomUpView alloc]init];
    //代理需要遵守SteCommonFromBottomUpViewDelegate协议,实现其方法
    view.externDelegate = self; 
    SteBaseAnimationViewController* ctrl = [SteBaseAnimationViewController loadWithInsetView:view animationObj:animationObj];
    [self presentViewController:ctrl animated:NO completion:nil];
}
```

```
#pragma mark- SteCommonFromBottomUpViewDelegate

- (void)SteCommonFromBottomUpViewCancel:(SteCommonFromBottomUpView*)view {
    NSLog(@"%@ Cancel Action!",view);
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)SteCommonFromBottomUpViewConfirm:(SteCommonFromBottomUpView*)view {
    NSLog(@"%@ Confirm Action!",view);
    [self dismissViewControllerAnimated:NO completion:nil];
}
```

### UseType2
```
- (void)toastType3 {
    SteViewControllerSpringAnimationViewObj* animationObj = [[SteViewControllerSpringAnimationViewObj alloc]init];
    SteCommonSingleTitleAndDoubleActionView* view = [[SteCommonSingleTitleAndDoubleActionView alloc]init];
    //代理需准守
    SteCommonSingleTitleAndDoubleActionView* view = [[SteCommonSingleTitleAndDoubleActionView alloc]init];
    SteCommonSingleTitleAndDoubleActionView* view = [[SteCommonSingleTitleAndDoubleActionView alloc]init];
    view.externDelegate = self;
    SteBaseAnimationViewController* ctrl = [SteBaseAnimationViewController loadWithInsetView:view animationObj:animationObj];
    //ctrl.enableMaskViewTapAction = NO;
    //ctrl.scrollEnable = YES;
    [self presentViewController:ctrl animated:NO completion:nil];
}
```

```
#pragma mark- SteCommonBaseSpringViewDelegate

- (void)steCommonBaseSpringView:(SteCommonBaseSpringView*)view withActionType:(SteCommonBaseSpringViewActionType)type {
    NSLog(@"====type:%lu",(unsigned long)type);
    [self dismissViewControllerAnimated:NO completion:nil];
}
```
