//
//  ClWindow.h
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CLTabbarView.h"
#import "CLTabWindowController.h"

static NSRect CLRect;
static NSSize CLSize;
NS_ASSUME_NONNULL_BEGIN

@interface ClWindow : NSWindow
@property (nonatomic, strong) CLTabbarView *tabbarView;
@property (nonatomic, assign) CGFloat TWidth;
@property (nonatomic, assign) BOOL isSVGImage;
- (void)setTabWindowController:(CLTabWindowController *)tabWindowController;

@end

NS_ASSUME_NONNULL_END
