//
//  CLFolderWindowController.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/27.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "CLFolderWindowController.h"

@interface CLFolderWindowController ()

@end

@implementation CLFolderWindowController


- (instancetype)init
{
    self = [super initWithWindowNibName:NSStringFromClass([self class])];
    if (self) {
        
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    self.window.title = @"CLFolderWindowController";
    NSLog(@"windowDidLoad CLFolderWindowController");
}

- (void)dealloc {
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

@end
