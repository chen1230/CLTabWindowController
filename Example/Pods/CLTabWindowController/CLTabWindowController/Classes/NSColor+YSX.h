//
//  NSColor+YSX.h
//  YunShixun
//
//  Created by home on 2019/3/21.
//  Copyright © 2019 ying. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (YSX)
+ (NSColor*)colorWithHex:(NSUInteger)hexColor;
+ (NSColor*)colorWithHex:(NSUInteger)hexColor alpha:(CGFloat)alpha;

@end
