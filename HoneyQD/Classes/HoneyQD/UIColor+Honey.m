//
//  UIColor+Honey.m
//  Expecta
//
//  Created by 陈林 on 2017/12/5.
//

#import "UIColor+Honey.h"

@implementation UIColor (Honey)

+ (UIColor *)colorWithHexString:(NSString *)color {
    
    //删除字符串中的空格符
    NSString * colorStr = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    NSInteger colorLength = [colorStr length];
    switch (colorLength) {
        case 6:
            //说明是 @“123456”类型的颜色，那么
            colorStr = [colorStr stringByAppendingString:@"FF"];
            break;
            case 7:
            //说明是 @“#123456”类型的颜色
            colorStr = [[colorStr substringFromIndex:1] stringByAppendingString:@"FF"];
            break;

            case 8:  //此时有两种情况，@“0X123456”,@"123456E6"
            if ([colorStr hasPrefix:@"0X"] || [colorStr hasPrefix:@"0x"]) {
                colorStr = [[colorStr substringFromIndex:2] stringByAppendingString:@"FF"];
            }
            // @"123456E6"这个不用处理
            break;

        case 9: //说明是 @“#123456E6”这种格式
            colorStr = [colorStr substringFromIndex:1];
            break;
        case 10: //说明是@“0x123456E6”这种格式
            colorStr = [colorStr substringFromIndex:2];
            break;
        default:
            colorStr = @"00000000";
            break;
            
    }

    NSRange range = NSMakeRange(0, 2);
    NSString *redStr = [colorStr  substringWithRange:range];
    range.location = 2;
    NSString *greenStr = [colorStr substringWithRange:range];
    range.location = 4;
    NSString *blueStr = [colorStr substringWithRange:range];
    range.location = 6;
    NSString *alphaStr = [colorStr substringWithRange:range];

    unsigned int r, g, b, a;
    [[NSScanner scannerWithString:redStr] scanHexInt:&r];
    [[NSScanner scannerWithString:greenStr] scanHexInt:&g];
    [[NSScanner scannerWithString:blueStr] scanHexInt:&b];
    [[NSScanner scannerWithString:alphaStr] scanHexInt:&a];
    
     
    
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:((float)a / 255.0f)];
    
}

@end
