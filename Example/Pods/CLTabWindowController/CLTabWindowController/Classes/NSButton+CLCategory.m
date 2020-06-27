//
//  NSButton+CLCategory.m
//  ChangeConfig
//
//  Created by chen on 2020/5/16.
//  Copyright © 2020 chen1230. All rights reserved.
//

/**
    imageScaling 图片填充模式
    NSImageScaleProportionallyDown   缩放图片，保持宽高比
    NSImageScaleAxesIndependently,  缩放宽高，改变宽高保持适正好填充
    NSImageScaleNone, 无缩放
    NSImageScaleProportionallyUpOrDown, 缩放最大的尺寸，不改变宽高比
 */

#import "NSButton+CLCategory.h"
#import <objc/runtime.h>
@implementation NSButton (CLCategory)

- (void)setBackBlock:(BackBlock)backBlock{
    objc_setAssociatedObject(self, @"backBlock", backBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(BackBlock)backBlock{
    return objc_getAssociatedObject(self, @"backBlock");
}

+ (NSButton *)newButton{
    NSButton *buttn =[[NSButton alloc] init];
    buttn.bordered = NO;
    return buttn;
}

- (NSButton *(^)(NSString *))cl_Title{
    return ^(NSString *title){
        self.title = title;
        return self;
    };
}

- (NSButton *(^)(NSString *))cl_AlternateTitle{
    return ^(NSString *alternateTitle){
        self.alternateTitle = alternateTitle;
        self.cl_ButtonType(NSButtonTypeToggle);
        return self;
    };
}

- (NSButton *(^)(NSString *))cl_ToolTip{
    return ^(NSString *toolTip){
        self.toolTip = toolTip;
        return self;
    };
}

- (NSButton *(^)(NSButtonType))cl_ButtonType{
    return ^(NSButtonType type){
        [self setButtonType:type];
        return self;
    };
}

- (NSButton *(^)(NSImage *))cl_Image{
    return ^(NSImage *image){
        self.image = image;
        [self setImageScaling:NSImageScaleAxesIndependently]; //全部填充
        return self;
    };
}

- (NSButton *(^)(NSImage *))cl_AlternateImage{
    return ^(NSImage *alternateImage){
        self.alternateImage = alternateImage;
        return self;
    };
}

- (NSButton *(^)(NSView *))cl_addToSubview {
    return ^(NSView *subView){
        [subView addSubview:self];
        return self;
    };
}

- (NSButton *)onClick:(void(^)(NSButton *sender))sendBlock{
    self.action = @selector(onBtnClick:);
    self.target = self;
    self.backBlock = sendBlock;
    return self;
}

- (void)onBtnClick:(NSButton *)sender{
    if (self.backBlock) {
        self.backBlock(sender);
    }
}

- (NSButton *(^)(CGRect))cl_rect {
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (NSButton *(^)(NSColor *))cl_bgColor {
    return  ^(NSColor * backgroundColor) {
        self.wantsLayer = YES;
        self.layer.backgroundColor = backgroundColor.CGColor;
        return self;
    };
}

- (NSButton *(^)(NSColor *))cl_borderColor {
    return ^(NSColor *borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

- (NSButton *(^)(CGFloat ))cl_borderWidth {
    return ^(CGFloat borderWidth){
        self.bordered = borderWidth>0?YES:NO;
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (NSButton *(^)(CGFloat ))cl_cornerRadius {
    return ^(CGFloat value){
        self.layer.cornerRadius = value;
        self.wantsLayer = YES;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (NSButton *(^)(float ))cl_opacity {
    return ^(float value){
        self.layer.opacity = value;
        return self;
    };
}

- (NSButton *(^)(NSColor *))cl_TitleColor {
    return ^(NSColor *color){
        [self setButtonTitleColor:color range:NSMakeRange(0,self.title.length)];
        return self;
    };
}

- (NSButton *(^)(NSColor *,NSRange))cl_TitleColorWithRange {
    return ^(NSColor *color,NSRange range){
        [self setButtonTitleColor:color range:range];
        return self;
    };
}

- (void)setButtonTitleColor:(NSColor *)color range:(NSRange)range
{
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedTitle]];
    [attrTitle addAttribute:NSForegroundColorAttributeName
                      value:color
                      range:range];
    [attrTitle fixAttributesInRange:range];
    [self setAttributedTitle:attrTitle];
}

@end
