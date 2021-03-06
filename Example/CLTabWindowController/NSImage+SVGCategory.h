//
//  NSImage+SVGCategory.h
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSImage (SVGCategory)
+ (NSImage *)svgImageNamed:(NSString *)name size:(CGSize)size;

+ (NSImage *)svgNamed:(NSString *)svgNamed cgColor:(CGColorRef)cgColor;

+ (NSImage *)svgNamed:(NSString *)svgNamed cgColor:(CGColorRef)cgColor identifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
