//
//  UIColor+SteAddtion.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/19.
//Copyright © 2018年 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SteAddtion)

+ (UIColor*)colorWithHex:(NSInteger)hValue;
+ (UIColor*)colorWithHex:(NSInteger)hValue alpha:(CGFloat)aValue;

// 用户测试项目新添加的
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
