//
//  SteFont.m
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/19.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "SteFont.h"

/*
 ===============Palatino===============
 Palatino-Italic
 Palatino-Roman
 Palatino-BoldItalic
 Palatino-Bold
*/
 
inline  UIFont* StePTItalicFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"Palatino-Italic" size:size];
}

inline UIFont* StePTRomanFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"Palatino-Roman" size:size];
}

inline UIFont* StePTBoldItalicFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"Palatino-BoldItalic" size:size];
}

inline UIFont* StePTBoldFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"Palatino-Bold" size:size];
}


/*
 ===============PingFang SC===============
 PingFangSC-Medium
 PingFangSC-Semibold
 PingFangSC-Light
 PingFangSC-Ultralight
 PingFangSC-Regular
 PingFangSC-Thin
 */

inline UIFont* StePFMediumFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

inline UIFont* StePFSemiboldFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}

inline UIFont* StePFLightFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"PingFangSC-Light" size:size];
}

inline UIFont* StePFUltralightFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"PingFangSC-Ultralight" size:size];
}

inline UIFont* StePFRegularFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

inline UIFont* StePFThinFontWithSize(CGFloat size) {
    return [UIFont fontWithName:@"PingFangSC-Thin" size:size];
}
