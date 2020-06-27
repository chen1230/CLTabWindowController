//
//  ClWindow.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "ClWindow.h"
#import <Masonry/Masonry.h>
#import "NSView+CLCategory.h"
#import "CLTabItem.h"
@interface ClWindow()
@property (nonatomic, strong) CLTabWindowController *tabWindowController;
@end

@implementation ClWindow

+ (void)initialize {
    CLRect = NSMakeRect(0, 0, 830, 543);
}

- (instancetype)init {
    self = [super initWithContentRect:CLRect
                            styleMask:(
                                       NSWindowStyleMaskTitled |
                                       NSWindowStyleMaskClosable |
                                       NSWindowStyleMaskMiniaturizable |
                                       NSWindowStyleMaskFullSizeContentView |
                                       NSWindowStyleMaskResizable
                                       )
                              backing:NSBackingStoreBuffered
                                defer:YES];
    if (self) {
        [self center];
    }
    self.titlebarAppearsTransparent = YES;
    self.tabbarView = [[CLTabbarView alloc] init];
    [self.contentView addSubview:self.tabbarView];
    self.TWidth = 70;
    self.minSize = CLRect.size;
    
    [[self standardWindowButton:NSWindowFullScreenButton] setHidden:NO];
    [[self standardWindowButton:NSWindowFullScreenButton] setEnabled:YES];
    [[self standardWindowButton:NSWindowZoomButton] setEnabled:YES];
    
    return self;
}

- (void)setTabWindowController:(CLTabWindowController *)tabWindowController{
    _tabWindowController = tabWindowController;
    NSViewController *contentVC = [self.tabWindowController valueForKeyPath:@"tabViewController"];
    for (id obj in _tabWindowController.bindControllers) {
        if ([obj isKindOfClass:[NSViewController class]]) {
            NSViewController *vc = obj;
            [contentVC addChildViewController:vc];
            vc.view.frame = CGRectMake(self.TWidth, 0, CLRect.size.width-self.TWidth, CLRect.size.height);
        }
    }
     [self.contentView addSubview:contentVC.view];
    
    [self.tabbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.offset(0);
        make.top.offset(0);
        make.width.mas_equalTo(self.TWidth);
    }];

}

-(void)displayIfNeeded{
    [super displayIfNeeded];
    
}

- (void)layoutIfNeeded {
    [super layoutIfNeeded];
    
}

@end
