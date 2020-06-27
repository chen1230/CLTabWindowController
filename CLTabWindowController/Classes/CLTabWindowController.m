//
//  CLTabWindowController.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "CLTabWindowController.h"
#import "ClWindow.h"
#import <QuartzCore/QuartzCore.h>
#import <Masonry/Masonry.h>
@interface CLTabWindowController ()<NSWindowDelegate>
@property (nonatomic, strong) ClWindow *clWindow;
@property (nonatomic, strong) NSViewController *activeViewController;
@property (nonatomic, strong) NSViewController *tabViewController;
@end

@implementation CLTabWindowController

- (instancetype)init
{
    self = [super initWithWindowNibName:NSStringFromClass([self class])];
    if (self) {
        
        ClWindow *wind = [[ClWindow alloc] init];
        self.clWindow = wind;
        self.defaultItem = 0;
        self.tabWidth = 70;
        self.clWindow.delegate = self;
        self.window = wind;
    }
    return self;
}

- (void)setTabWidth:(CGFloat)tabWidth {
    _tabWidth = tabWidth;
    _clWindow.TWidth = tabWidth;
}

- (BOOL)windowShouldClose:(NSWindow *)sender {
    [NSApp hide:sender];
    return NO;
}

-(void)setTabViewItems:(NSArray <CLTabItem *>*)items{
    NSAssert(items.count >0, @"items can not be nil");
    self.clWindow.tabbarView.itemArray = items;
    _items = items;
    [self createBindControllers];
}

- (void)setItems:(NSArray *)items {
    _items = items;
    [self createBindControllers];
}

- (void)createBindControllers {
    [self.bindControllers removeAllObjects];
    for (CLTabItem *itme in self.items) {
        NSLog(@"create item %lu",(unsigned long)[self.items indexOfObject:itme]);
        [self.bindControllers addObject:[NSObject new]];
    }
}

- (NSViewController *)tabViewController {
    if (!_tabViewController) {
        NSAssert(self.clWindow.contentView, @"targetView must not be nil");
        _tabViewController = [[NSViewController alloc] init];
        _tabViewController.view = [[NSView alloc] init];
        _tabViewController.view.wantsLayer = YES;
        _tabViewController.view.frame = self.clWindow.contentView.bounds;
        _tabViewController.view.autoresizingMask = NSViewMinXMargin | NSViewWidthSizable | NSViewMaxXMargin | NSViewMinYMargin | NSViewHeightSizable | NSViewMaxYMargin ;
        [self.clWindow.contentView addSubview:_tabViewController.view];
    }
    return _tabViewController;
}

- (NSMutableArray *)bindControllers {
    if (!_bindControllers) {
        _bindControllers = [NSMutableArray array];
    }
    return _bindControllers;
}

- (void)setViewControllers:(NSArray <NSViewController *> *)controllers{
    NSAssert(controllers.count >0, @"controllers can not be nil");
    self.controllers = controllers;
}

- (void)activateViewController:(NSViewController *)viewController animate:(BOOL)animate {
    NSRect currentWindowFrame      = self.window.frame;
//    NSRect viewControllerFrame     = [(NSViewController *)viewController view].frame;
//    NSRect frameRectForContentRect = [self.window frameRectForContentRect:viewControllerFrame];

//    CGFloat deltaX = NSWidth(currentWindowFrame) - NSWidth(frameRectForContentRect);
//    CGFloat deltaY = NSHeight(currentWindowFrame) - NSHeight(frameRectForContentRect);
//    NSRect newWindowFrame = NSMakeRect(NSMinX(currentWindowFrame) + (/* DISABLES CODE */ (YES) ? deltaX / 2 : 0),
//                                       NSMinY(currentWindowFrame) + deltaY,
//                                       NSWidth(frameRectForContentRect),
//                                       NSHeight(frameRectForContentRect));
    NSRect newWindowFrame = currentWindowFrame;
    NSView *newContentView = [(NSViewController *)viewController view];
    newContentView.alphaValue = 0;

    __weak typeof(self) wSelf = self;
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = (animate ? 0.25 : 0);
        context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [[wSelf.window animator] setFrame:newWindowFrame display:YES];
        [[newContentView animator] setAlphaValue:1.0];
        [wSelf.tabViewController transitionFromViewController:wSelf.activeViewController toViewController:viewController options:NSViewControllerTransitionAllowUserInteraction completionHandler:nil];
    } completionHandler:^{
        wSelf.activeViewController = viewController;
    }];
}

- (void)setItem:(CLTabItem *)item bindViewController:(NSViewController *)viewController {
    if (item) {
        NSInteger index = [self.items indexOfObject:item];
        [self.bindControllers replaceObjectAtIndex:index withObject:viewController];
    }
}

- (void)setItem:(CLTabItem *)item bindWindowController:(NSWindowController *)windowController {
    if (item) {
        NSInteger index = [self.items indexOfObject:item];
        [self.bindControllers replaceObjectAtIndex:index withObject:windowController];
       }
}

- (void)setItem:(CLTabItem *)item bindWindowControllerString:(NSString *)windowString {
    if (item) {
        NSInteger index = [self.items indexOfObject:item];
        [self.bindControllers replaceObjectAtIndex:index withObject:windowString];
       }
}

- (void)setDefaultItem:(NSInteger)defaultItem {
    _defaultItem = defaultItem;
    self.clWindow.tabbarView.selectIndex = defaultItem;
}

- (void)showWindow {

    [self.clWindow setTabWindowController:self];
    self.activeViewController = [self.bindControllers objectAtIndex:self.defaultItem];
    [_tabViewController.view addSubview:self.activeViewController.view];
    
    [_activeViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.offset(0);
        make.left.offset(self.tabWidth);
    }];
    
    __weak typeof(self) wSelf = self;
    [self.clWindow.tabbarView onClick:^(NSInteger index, NSButton * _Nonnull sender) {
        
        NSViewController *controller = [wSelf.bindControllers objectAtIndex:index];
        if ([controller isKindOfClass:[NSViewController class]]) {
            if (index!= wSelf.defaultItem) {
                sender.state = NSControlStateValueOn;
                CLTabItem *oldTabIte = [self.items objectAtIndex:wSelf.defaultItem];
                oldTabIte.state =NSControlStateValueOff;
                [wSelf activateViewController:controller animate:YES];
                wSelf.defaultItem = index;
            }else{
                sender.state = NSControlStateValueOn;
            }

        }else if ([controller isKindOfClass:[NSWindowController class]]){
            [sender.cell setHighlightsBy:NSPushInCellMask];
            NSWindowController *windVC = (NSWindowController *)controller;
            [windVC showWindow:windVC];
            [windVC.window makeKeyAndOrderFront:nil];
        } else if([controller isKindOfClass:[NSString class]]){
            NSWindowController *newWindow = [[NSClassFromString((NSString *)controller) alloc] init];
            if ([newWindow isKindOfClass:[NSWindowController class]] && newWindow) {
                [sender.cell setHighlightsBy:NSPushInCellMask];
                [newWindow showWindow:newWindow];
                [newWindow.window makeKeyAndOrderFront:nil];
            }
        }else{
            [sender.cell setHighlightsBy:NSPushInCellMask];
        }
        
        if (wSelf.delegate &&[wSelf.delegate respondsToSelector:@selector(didSelectItem:withSender:)]) {
            [wSelf.delegate didSelectItem:index withSender:sender];
        }
    }];
    self.window.alphaValue = 0.0;
    [self showWindow:self];
    [self.window makeKeyAndOrderFront:self];
    [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
    self.window.alphaValue = 1.0;
}


- (void)dismissWindow {
    [self close];
}


@end
