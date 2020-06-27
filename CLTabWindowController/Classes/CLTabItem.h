//
//  CLTabItem.h
//  CLTabWindowController
//
//  Created by chen on 2020/6/26.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLTabItem : NSButton

@property (nonatomic, assign) CGSize itmeSize;
@property (nonatomic, strong) NSImage *normalImage;
@property (nonatomic, strong) NSImage *selectImage;
- (instancetype)initWithSize:(CGSize)size;

- (void)setNormalImage:(NSImage * _Nonnull)normalImage selectImage:(NSImage *)selectImage;


@end

NS_ASSUME_NONNULL_END
