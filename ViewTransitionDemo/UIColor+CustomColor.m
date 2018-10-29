//
//  UIColor+CustomColor.m
//  ViewTransitionDemo
//
//  Created by Jasmine on 2018/10/29.
//  Copyright © 2018 Jasmine. All rights reserved.
//

#import "UIColor+CustomColor.h"

#define UIColorFromRGBHex(rgbValue)                                    \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:1.0]

@implementation UIColor (CustomColor)

+ (UIColor *)customGrayColor
{
    // return [self colorWithRed:84 green:84 blue:84];
    return UIColorFromRGBHex(0x7e7e7e);
}

+ (UIColor *)customRedColor
{
    return [self colorWithRed:231 green:76 blue:60];
}

+ (UIColor *)customYellowColor
{
    return [self colorWithRed:241 green:196 blue:15];
}

+ (UIColor *)customGreenColor
{
    return [self colorWithRed:46 green:204 blue:113];
}

+ (UIColor *)customBlueColor
{
    return [self colorWithRed:52 green:152 blue:219];
}

#pragma mark - Private class methods

+ (UIColor *)colorWithRed:(NSUInteger)red
                    green:(NSUInteger)green
                     blue:(NSUInteger)blue
{
    return [UIColor colorWithRed:(float)(red/255.f)
                           green:(float)(green/255.f)
                            blue:(float)(blue/255.f)
                           alpha:1.f];
}


@end
