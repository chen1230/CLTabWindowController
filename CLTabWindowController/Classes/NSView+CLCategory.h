//
//  NSView+CLCategory.h
//  YunShixun
//
//  Created by chen on 2020/5/7.
//  Copyright © 2020 ying. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSView (CLCategory)
+ (instancetype)newView;

- (NSView *(^)(CGRect))cl_rect;

- (NSView *(^)(NSColor *))cl_bgColor;

- (NSView *(^)(NSView *))cl_addToSubview;

- (NSView *(^)(NSColor *))cl_borderColor;

- (NSView *(^)(CGFloat ))cl_borderWidth;

- (NSView *(^)(CGFloat ))cl_cornerRadius;

- (NSView *(^)(float ))cl_opacity;

//- (NSView *)makeConstraints:(void(^)(MASConstraintMaker *make))block;

@end

NS_ASSUME_NONNULL_END
