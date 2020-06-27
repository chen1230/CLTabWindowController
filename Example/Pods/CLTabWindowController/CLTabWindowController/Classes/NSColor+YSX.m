//
//  NSColor+YSX.m
//  YunShixun
//
//  Created by home on 2019/3/21.
//  Copyright © 2019 ying. All rights reserved.
//

#import "NSColor+YSX.h"

@implementation NSColor (YSX)

+ (NSColor*)colorWithHex:(NSUInteger)hexColor {
    return [NSColor colorWithHex:hexColor alpha:1.f];
}

+ (NSColor*)colorWithHex:(NSUInteger)hexColor alpha:(CGFloat)alpha{
    CGFloat red = ((CGFloat)((hexColor & 0xFF0000) >> 16)) / 255.f;
    CGFloat green = ((CGFloat)((hexColor & 0xFF00) >> 8)) / 255.f;
    CGFloat blue = ((CGFloat)(hexColor & 0xFF)) / 255.f;
    
    return [NSColor colorWithRed:red green:green blue:blue alpha:alpha];
}
@end
