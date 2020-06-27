//
//  NSButton+CLCategory.h
//  ChangeConfig
//
//  Created by chen on 2020/5/16.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN
typedef   void(^BackBlock)(NSButton *button);
@interface NSButton (CLCategory)
@property (nonatomic, copy)BackBlock backBlock;

+(NSButton *)newButton;
- (NSButton *(^)(CGRect))cl_rect;

- (NSButton *(^)(NSColor *))cl_bgColor;

- (NSButton *(^)(NSColor *))cl_borderColor;

- (NSButton *(^)(CGFloat ))cl_borderWidth;

- (NSButton *(^)(CGFloat ))cl_cornerRadius;

- (NSButton *(^)(float ))cl_opacity;

- (NSButton *(^)(NSString *))cl_Title;

- (NSButton *(^)(NSString *))cl_AlternateTitle;

- (NSButton *(^)(NSImage *))cl_Image;

- (NSButton *(^)(NSImage *))cl_AlternateImage;

- (NSButton *(^)(NSString *))cl_ToolTip;

- (NSButton *(^)(NSView *))cl_addToSubview;

- (NSButton *(^)(NSButtonType))cl_ButtonType;

- (NSButton *(^)(NSColor *))cl_TitleColor;

- (NSButton *(^)(NSColor *,NSRange))cl_TitleColorWithRange;

- (NSButton *)onClick:(void(^)(NSButton *sender))sendBlock;
@end

NS_ASSUME_NONNULL_END
