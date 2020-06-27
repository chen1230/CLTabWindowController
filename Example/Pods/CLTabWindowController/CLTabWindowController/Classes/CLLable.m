//
//  CLLable.m
//  ChangeConfig
//
//  Created by chen on 2020/5/17.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "CLLable.h"
@implementation CLLable

+ (instancetype)newLable {
    return [[self alloc] init];
}

- (CLLable *(^)(NSString *))cl_Text {
    return  ^(NSString * string) {
        self.stringValue = string;
        return self;
    };
}

- (CLLable *(^)(NSAttributedString *))cl_AttributedText {
    return  ^(NSAttributedString * string) {
        self.attributedStringValue = string;
        return self;
    };
}




- (CLLable *(^)(CGRect))cl_rect {
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (CLLable *(^)(NSColor *))cl_bgColor {
    return  ^(NSColor * backgroundColor) {
        self.wantsLayer = YES;
        self.layer.backgroundColor = backgroundColor.CGColor;
        self.bezeled = NO;
        return self;
    };
}

- (CLLable *(^)(NSView *))cl_addToSubview {
    return ^(NSView * addSub){
//         self.delegate = self;
         [addSub addSubview:self];
         return self;
    };
}

- (CLLable *(^)(NSColor *))cl_borderColor {
    return ^(NSColor *borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

- (CLLable *(^)(NSColor *))cl_TextColor {
    return ^(NSColor *textColor){
        self.textColor = textColor;
        return self;
    };
}

- (CLLable *(^)(NSString *))cl_ToolTip {
    return ^(NSString *toolTip){
        self.toolTip = toolTip;
        return self;
    };
}

- (CLLable *(^)(CGFloat ))cl_borderWidth {
    return ^(CGFloat borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (CLLable *(^)(CGFloat ))cl_cornerRadius {
    return ^(CGFloat value){
        self.layer.cornerRadius = value;
        self.wantsLayer = YES;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (CLLable *(^)(float ))cl_opacity {
    return ^(float value){
        self.layer.opacity = value;
        return self;
    };
}

- (CLLable *(^)(NSTextAlignment ))cl_Alignment {
    return ^(NSTextAlignment alignment){
        self.alignment = alignment;
        return self;
    };
}

- (CLLable *(^)(NSFont *))cl_Font {
    return ^(NSFont *font){
        self.font = font;
        
        return self;
    };
}

- (CLLable *(^)(NSInteger ))cl_MaximumNumberOfLines API_AVAILABLE(macos(10.11)){
    return ^(NSInteger lines){
        if (@available(macOS 10.11, *)) {
            self.maximumNumberOfLines = lines;
        } else {
            // Fallback on earlier versions
        }
        return self;
    };
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


- (id)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        self.editable = NO;
        self.selectable = NO;
        self.bezeled = NO;
        self.drawsBackground = NO;
    }
    return self;
}

@end
