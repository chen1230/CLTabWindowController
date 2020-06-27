//
//  CLTabItem.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/26.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "CLTabItem.h"
#import <CLTabWindowController/CLTabWindowController.h>
@implementation CLTabItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, size.width, size.height);
        self.itmeSize = size;
        self.cl_borderWidth(0.f).cl_ButtonType(NSButtonTypeToggle);
        [self.cell setHighlightsBy:NSNoCellMask]; //取消鼠标点击下的高亮状态的效果

    }
    return self;
}

- (void)setNormalImage:(NSImage * _Nonnull)normalImage selectImage:(NSImage *)selectImage {
    self.normalImage = normalImage;
    self.selectImage = selectImage;
    self.cl_Image(normalImage).cl_AlternateImage(selectImage);
}

- (void)setNormalImage:(NSImage *)normalImage {
    _normalImage = normalImage;
    self.cl_Image(normalImage);
}

- (void)setSelectImage:(NSImage *)selectImage {
    _selectImage = selectImage;
    self.cl_AlternateImage(selectImage);
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
