//
//  CLTabWindowController.h
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CLTabItem.h"
NS_ASSUME_NONNULL_BEGIN
@protocol CLTabViewDelegate <NSObject>

- (void)didSelectItem:(NSInteger)index withSender:(NSButton *)button;

@end

@interface CLTabWindowController : NSWindowController
@property (nonatomic, weak) id <CLTabViewDelegate> delegate;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) NSMutableArray *bindControllers;
// 默认选中第几个
@property (nonatomic, assign) NSInteger defaultItem;
/**
  设置tabView的宽，默认70
 */
@property (nonatomic, assign) CGFloat tabWidth;
//设置侧边栏的按钮数组对象
- (void)setTabViewItems:(NSArray <CLTabItem *>*)items;
- (void)setViewControllers:(NSArray <NSViewController *> *)controllers;
//默认一一对应，如果设置了item ->viewController的对应关系，就绑定在一起了
- (void)setItem:(CLTabItem *)item bindViewController:(NSViewController *)viewController;
// 绑定NSWindowController对象，关闭后对象不会销毁
- (void)setItem:(CLTabItem *)item bindWindowController:(NSWindowController *)windowController;
// 绑定NSWindowController class 字符串，关闭后对象会销毁
- (void)setItem:(CLTabItem *)item bindWindowControllerString:(NSString *)windowString;

// 显示窗口
- (void)showWindow;

// 关闭窗口
- (void)dismissWindow;

@end

NS_ASSUME_NONNULL_END
