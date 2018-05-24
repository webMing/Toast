//
//  SteFont.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/19.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*
 
测试两种字体

 ===============PingFang SC===============
 PingFangSC-Medium
 PingFangSC-Semibold
 PingFangSC-Light
 PingFangSC-Ultralight
 PingFangSC-Regular
 PingFangSC-Thin
 
 ===============Palatino===============
 Palatino-Italic
 Palatino-Roman
 Palatino-BoldItalic
 Palatino-Bold
 
 */


/*
 一个项目可能使用多中字体;但只有一种占据主要地位
 */

#define StePT_Italic_Font_Size(size)      StePTItalicFontWithSize(size)
#define StePT_Roman_Font_Size(size)       StePTRomanFontWithSize(size)
#define StePT_BoldItalic_Font_Size(size)  StePTBoldItalicFontWithSize(size)
#define StePT_Bold_Font_Size(size)        StePTBoldFontWithSize(size)

FOUNDATION_EXPORT UIFont* StePTItalicFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePTRomanFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePTBoldItalicFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePTBoldFontWithSize(CGFloat size);


#define StePF_Medium_Font_Size(size)     StePFMediumFontWithSize(size)
#define StePF_Semibold_Font_Size(size)   StePFSemiboldFontWithSize(size)
#define StePF_Light_Font_Size(size)      StePFLightFontWithSize(size)
#define StePF_Ultralight_Font_Size(size) StePFUltralightFontWithSize(size)
#define StePF_Regular_Font_Size(size)    StePFRegularFontWithSize(size)
#define StePF_Thin_Font_Size(size)       StePFThinFontWithSize(size)

FOUNDATION_EXPORT UIFont* StePFMediumFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFSemiboldFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFLightFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFUltralightFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFRegularFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFThinFontWithSize(CGFloat size);


/*尝试themeFont PrimaryFont
 1.首先想到是通过动态改变UIFont.pointSize 来改变字体大小.但是系统的pointSize是readOnly 这种方法是行不通的;
 2.通过继承来实现,此方法的副作用就是 “增添了一些类” , 通过协议也是需要继承;
 3.method swizzling hook UILable SearchBar NaviBar UIButton UItextFiled UITextView UISegment UITabBar UIToolBar.... 注意UIWebView
 
 */
