//
//  NSView+CLCategory.m
//  YunShixun
//
//  Created by chen on 2020/5/7.
//  Copyright © 2020 ying. All rights reserved.
//

#import "NSView+CLCategory.h"

@implementation NSView (CLCategory)

+ (instancetype)newView {
    return [[self alloc] init];
}


- (NSView *(^)(CGRect))cl_rect {
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (NSView *(^)(NSColor *))cl_bgColor {
    return  ^(NSColor * backgroundColor) {
        self.wantsLayer = YES;
        self.layer.backgroundColor = backgroundColor.CGColor;
        return self;
    };
}

- (NSView *(^)(NSView *))cl_addToSubview {
    return ^(NSView * addSub){
        [addSub addSubview:self];
         return self;
    };
}

- (NSView *(^)(NSColor *))cl_borderColor {
    return ^(NSColor *borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

- (NSView *(^)(CGFloat ))cl_borderWidth {
    return ^(CGFloat borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (NSView *(^)(CGFloat ))cl_cornerRadius {
    return ^(CGFloat value){
        self.layer.cornerRadius = value;
        self.wantsLayer = YES;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (NSView *(^)(float ))cl_opacity {
    return ^(float value){
        self.layer.opacity = value;
        return self;
    };
}

//- (NSView *)makeConstraints:(void(^)(MASConstraintMaker *make))block{
//
//    [self mas_makeConstraints:block];
//    return self;
//}




@end
