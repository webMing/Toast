//
//  SteCommonActionPopView.h
//
//  Created by Stephanie on 2018/5/16.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

typedef NS_ENUM(NSUInteger, SteCommonBaseSpringViewActionType) {
    SteCommonBaseSpringViewCenterAction = 1,
    SteCommonBaseSpringViewRightAction = 2,
    SteCommonBaseSpringViewLeftAction = 3,
    SteCommonBaseSpringViewNoneAction = 4, //mask view action;
};

#import "SteViewControllerAnimationSuperView.h"

@class SteCommonBaseSpringView ;
@protocol SteCommonBaseSpringViewDelegate <NSObject>
- (void)steCommonBaseSpringView:(SteCommonBaseSpringView*)view withActionType:(SteCommonBaseSpringViewActionType)type;
@end

@interface SteCommonBaseSpringView : SteViewControllerAnimationSuperView
@property (nonatomic, weak) id<SteCommonBaseSpringViewDelegate>externDelegate;
@property (nonatomic, assign) SteCommonBaseSpringViewActionType type;
@end
