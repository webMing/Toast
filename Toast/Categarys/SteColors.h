//
//  SteColors.h
//  AutoLayOutC1
//
//  Created by Stephanie on 2018/5/19.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 
 >1 根据颜色名称定义Color
 
 UIColor* SteWhiteColor;
 UIColor* SteRedColor;
 UIColor* SteGrayColor;
 UIColor* SteLihgtGrayColor;
 UIColor* SteClearColor;
 
 存代码开发中如果通过点击某个UI元素显示某个元素的:字体类型,字体大小,颜色
 使用上面颜色定义就有点费劲(前期需要熟练记忆这些颜色,有些颜色在UI元素不容易区分:SteGrayColor与SteLihgtGrayColor)
 
 可以改成以颜色十六进制数声明颜色的方式:
 UIColor* SteF2F5F8HexColor;其中 F2F5F8 是十六进制的颜色值;
 UIColor* SteF2F5F8HexColorWithAlpha:(float f); 其中 F2F5F8 是十六进制的颜色值;
 
 其他颜色可以定义为以下形式：
 UIColor* WarningColor;      //警告
 UIColor* UnvaildColor;      //失效
 UIColor* ClearnColor;       //透明
 UIColor* SeperaterLineColor; //分割线
 
 >2 颜色的定义使用宏还是内联函数
 使用宏定义颜色不会太复杂,宏定义也可以;
 如果工程中有提供全局访问的某些功能尽量使用内联函数,宏定义如果太复杂容易出错
 #define SteWColor SteWhiteColor
 #define SteRColor SteRedColor
 
 >3 根据主题,一级标题,二级标题等定义颜色
 1.更改某一个标题的颜色很简单
 2.纯代码开发中如果某个UI元素直接显示出现的效果是:PrimaryTitleColor,fontSize,fontName
   能使开发效率提升很多☺
 
 UIColor* ThemeColor; //主题color
 UIColor* PrimaryTitleColor; //一级标题
 UIColor* SecondTitleColor;  //二级标题
 
 UIColor* WarningColor;      //警告
 UIColor* UnvaildColor;      //失效
 UIColor* ClearnCrolor;       //透明
 
 3.如果项目可以实现这种效果,为了统一管理 那么我们需要统一实现所有基础控件?
 
  -- 根据实际情况而定 --
 
 通过添加UILable分类组合方式实现:ThemeLabel,PrimaryLabel..... ,通过继承的方式也是可以的.
 
 + (UILabel*)themeLable{
    UILabel* lb = [[UILabel alloc]initWithFrame:CGRectZero];
    lb.font = ThemeFontWithSize:23.;
    lb.textColor = ThemeColor;
    return lb;
 }
 
 1.缺点:UILable分类中添加很多类方法分类体积增大;如果通过继承实现造成类爆炸;迁出其他工程中的时 容易拖泥带水;
 2.如果有一个需求是把 theme类型的字体调大 包括label 还有themeBtn,我们就可以实现上面的方式调整ThemeLb.
 (为什么不能使用method swizzling 的AOP效果实现, 项目中能不用就不用,黑魔法虽好,但是如果后期出了问题,调试的代价会很高);满足此需求也可以创建一个ThemeFount,而不创建themeLabel;
 
 >4 纯代码开发中如果某个UI元素直接显示出现的效果是:PrimaryLabel,PrimaryBtn,那么开发效率将是成倍提高;
 
 >5 项目中根据不同屏幕调整字体大小,可以实现ThemeFont,PrimaryFont这种方式;
    如果项目中有多中字体,需要定义多套相应字体的Font :PCThemeFont,PCThemeFont,SYSThemeFont,SYSThemeFont
   建议项目的设计稿按照Theme,SecondTitle这种方式来设计,这样可以防止在项目基本快要完成的时候，突然要修改;文字大小的需求
 
   ThemeFont,ThemeColor 甚至ThemeLb,PrimaryBtn; PrimaryFont,PrimaryColor ,Primary,PrimaryBtn; 是一一对应;
 */

#define Ste_Comfirm_Color    SteComfirmColor()
#define Ste_Cancle_Color     SteCancleColor()
#define Ste_Seperater_Color  SteSeperaterColor()
#define Ste_Clear_Color      SteSeperaterColor()

FOUNDATION_EXPORT UIColor* SteComfirmColor(void);
FOUNDATION_EXPORT UIColor* SteCancleColor(void);
FOUNDATION_EXPORT UIColor* SteSeperaterColor(void);
FOUNDATION_EXPORT UIColor* SteClearColor(void);

/*
UIColor* SteColorWithRGBSpace(int r,int g,int b);

UIColor* SteColorWithRGBASpace(int r,int g,int b,float a);

UIColor* SteColorWithHexRGBSpace(int h);

UIColor* SteColorWithHexRGBASpace(int h,float a);
*/

