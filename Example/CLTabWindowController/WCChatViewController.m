//
//  WCChatViewController.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/26.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "WCChatViewController.h"

@interface WCChatViewController ()

@end

@implementation WCChatViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self reLoadView];
    }
    return self;
}

- (void)reLoadView{
    
}

- (void)viewWillAppear {
    [super viewWillAppear];
    self.view.autoresizingMask = NSViewMinXMargin | NSViewWidthSizable |  NSViewMinYMargin | NSViewHeightSizable | NSViewMaxYMargin;

    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor yellowColor].CGColor;
}



@end
