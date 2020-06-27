//
//  CLTabbarView.h
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CLTabItem.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^TabOnclick)(NSInteger index, NSButton *sender);

@interface CLTabbarView : NSView
@property (nonatomic, strong) NSVisualEffectView *effectView;
@property (nonatomic, copy) NSArray <CLTabItem *> *itemArray;
@property (nonatomic, assign) NSInteger selectIndex; // 默认选中第一个
@property (nonatomic, copy) TabOnclick tabOnclickBlock;

- (void)onClick:(void(^)(NSInteger index, NSButton *sender))sendBlock;

@end

NS_ASSUME_NONNULL_END
