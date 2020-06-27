//
//  CLTabbarView.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "CLTabbarView.h"
#import <Masonry/Masonry.h>
#import <CLTabWindowController/CLTabWindowController.h>
#import <SVGKit/SVGKit.h>
#import "NSImage+SVGCategory.h"
#import "NSColor+YSX.h"
@interface CLTabbarView()


@end

@implementation CLTabbarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.selectIndex = 0;
    self.effectView = [[NSVisualEffectView alloc] init];
    [self addSubview:self.effectView];
    [self.effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
    //设置毛玻璃效果
    self.effectView.material = NSVisualEffectMaterialUltraDark;
}

-(void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
}

- (void)setItemArray:(NSArray<CLTabItem *> *)itemArray
 {
    _itemArray = itemArray;
    [self.effectView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0; i<self.itemArray.count; i++) {
        CLTabItem *btn = [self.itemArray objectAtIndex:i];
        btn.cl_addToSubview(self);
        __weak typeof(self)wself = self;
        [btn onClick:^(NSButton * _Nonnull sender) {
            NSLog(@"点击了");
            [wself handerOnclick:sender];
        }];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.top.offset(50+i*60);
        }];
    }
}

- (void)handerOnclick:(NSButton *)sender{
    NSInteger index = [self.itemArray indexOfObject:(CLTabItem *)sender];
    if (self.tabOnclickBlock) {
        self.tabOnclickBlock(index, sender);
    }
}

- (void)onClick:(void(^)(NSInteger index, NSButton *sender))sendBlock {
    self.tabOnclickBlock = sendBlock;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if (self.itemArray && self.itemArray>0) {
        NSAssert(self.selectIndex < self.itemArray.count, @"selectIndex cannot be greater than items count");
        CLTabItem *btn = [self.itemArray objectAtIndex:self.selectIndex];
        btn.state = NSControlStateValueOn;
    }
}

@end
