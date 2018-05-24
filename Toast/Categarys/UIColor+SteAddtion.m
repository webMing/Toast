//
//  UIColor+SteAddtion.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/19.
//Copyright © 2018年 Stephanie. All rights reserved.
//

#import "UIColor+SteAddtion.h"

@implementation UIColor (SteAddtion)

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*)colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{

// NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    return [self colorWithHex:hexString.integerValue alpha:1.0f];
}


@end
