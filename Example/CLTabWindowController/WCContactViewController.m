//
//  WCContactViewController.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/26.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "WCContactViewController.h"

@interface WCContactViewController ()

@end

@implementation WCContactViewController

- (void)viewWillAppear {
    [super viewWillAppear];
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = _bgColor?_bgColor.CGColor:[NSColor redColor].CGColor;
    self.view.autoresizingMask = NSViewMinXMargin | NSViewWidthSizable | NSViewMaxXMargin | NSViewMinYMargin | NSViewHeightSizable | NSViewMaxYMargin;
}

@end
