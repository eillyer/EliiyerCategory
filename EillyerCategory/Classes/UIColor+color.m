//
//  UIColor+color.m
//  QualityCloud
//
//  Created by julong on 2017/4/10.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "UIColor+color.h"
#define UIColorFromHex(s)  [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]


@implementation UIColor (color)
+ (UIColor *)colorWith16hux:(char)color16{
    return UIColorFromHex(color16);
}

@end
