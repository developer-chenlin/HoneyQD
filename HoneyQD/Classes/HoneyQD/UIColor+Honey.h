//
//  UIColor+Honey.h
//  Expecta
//
//  Created by 陈林 on 2017/12/5.
//

#import <UIKit/UIKit.h>


@interface UIColor (Honey)

/**
 16进制字符串转颜色

 @param color 16进制字符串(支持不携带 alpha 值的 @“#123456”、@“0X123456”、 @“123456”三种格式以及携带alpha的@“#123456E6”、@“0X123456E6”、 @“123456E6”三种形式)
  @return 返回颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color ;



/**
 10进制转颜色

 @param R R值（0 ~ 255）
 @param G G值（0 ~ 255）
 @param B B值（0 ~ 255）
 @return 颜色
 */
+ (UIColor *)colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B;
 
@end
