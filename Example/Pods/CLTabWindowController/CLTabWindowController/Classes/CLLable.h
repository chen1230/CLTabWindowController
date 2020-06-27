//
//  CLLable.h
//  ChangeConfig
//
//  Created by chen on 2020/5/17.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLLable : NSTextField
+ (instancetype)newLable;

- (CLLable *(^)(NSString *))cl_Text;

- (CLLable *(^)(NSAttributedString *))cl_AttributedText;

- (CLLable *(^)(CGRect))cl_rect ;

- (CLLable *(^)(NSColor *))cl_bgColor;

- (CLLable *(^)(NSView *))cl_addToSubview;

- (CLLable *(^)(NSColor *))cl_borderColor;

- (CLLable *(^)(NSColor *))cl_TextColor;

- (CLLable *(^)(NSString *))cl_ToolTip;

- (CLLable *(^)(CGFloat ))cl_borderWidth;

- (CLLable *(^)(CGFloat ))cl_cornerRadius;

- (CLLable *(^)(float ))cl_opacity;

- (CLLable *(^)(NSTextAlignment ))cl_Alignment;

- (CLLable *(^)(NSFont *))cl_Font;

- (CLLable *(^)(NSInteger ))cl_MaximumNumberOfLines API_AVAILABLE(macos(10.11));
@end

NS_ASSUME_NONNULL_END
