//
//  ViewController.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <CLTabWindowController/CLTabWindowController.h>
#import "NSImage+SVGCategory.h"
#import "NSColor+YSX.h"
#import "WCChatViewController.h"
#import "WCContactViewController.h"
#import "CLFolderWindowController.h"

@interface ViewController()


@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSButton *btn = [NSButton newButton].cl_addToSubview(self.view).cl_Title(@"window").cl_borderColor([NSColor yellowColor]).cl_borderWidth(1.0);
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(20);
        make.width.height.mas_equalTo(50);
    }];
    
    __weak typeof(self)weakself = self;
    [btn onClick:^(NSButton * _Nonnull sender) {
        [weakself createWindowVC];
    }];
    

}

- (void)createWindowVC{
    CGColorRef normalColor = [NSColor colorWithHex:0xA3A2A4].CGColor;
    CGColorRef selectColor = [NSColor colorWithHex:0x20BF64].CGColor;
    
    CLTabItem *itme1 = [[CLTabItem alloc] initWithSize:CGSizeMake(30, 30)];
    [itme1 setNormalImage:[NSImage svgNamed:@"TabBar_Chat"
                                    cgColor:normalColor
                                 identifier:@"Chat"]
              selectImage:[NSImage svgNamed:@"TabBar_Chat_Selected"
                                    cgColor:selectColor
                                 identifier:@"Chat_Active"]];
    
    CLTabItem *itme2 = [[CLTabItem alloc] initWithSize:CGSizeMake(30, 30)];
      [itme2 setNormalImage:[NSImage svgNamed:@"TabBar_Contacts"
                                      cgColor:normalColor
                                   identifier:@"Contacts"]
                selectImage:[NSImage svgNamed:@"TabBar_Contacts_Selected"
                                      cgColor:selectColor
                                   identifier:@"Contact_Active"]];
    
    CLTabItem *itme3 = [[CLTabItem alloc] initWithSize:CGSizeMake(30, 30)];
         [itme3 setNormalImage:[NSImage svgNamed:@"TabBar_Favorites"
                                         cgColor:normalColor
                                      identifier:@"Collection"]
                   selectImage:[NSImage svgNamed:@"TabBar_Favorites_Selected"
                                         cgColor:selectColor
                                      identifier:@"Collection_Active"]];
    
    CLTabItem *itme4 = [[CLTabItem alloc] initWithSize:CGSizeMake(30, 30)];
         [itme4 setNormalImage:[NSImage svgNamed:@"TabBar_Folder"
                                         cgColor:normalColor
                                      identifier:@"Folder"]];
    
    WCChatViewController *ChatViewController = [[WCChatViewController alloc] init];
    ChatViewController.view = [[NSView alloc] init];
    WCContactViewController *ContactViewController = [[WCContactViewController alloc] init];
    ContactViewController.view = [[NSView alloc] init];
    WCContactViewController *ContactViewController1 = [[WCContactViewController alloc] init];
    ContactViewController1.view = [[NSView alloc] init];
    ContactViewController1.bgColor = [NSColor purpleColor];
    CLTabWindowController *vc = [[CLTabWindowController alloc] init];
    [vc setTabViewItems:@[itme1,itme2,itme3,itme4]];
    [vc setItem:itme1 bindViewController:ChatViewController];
    [vc setItem:itme2 bindViewController:ContactViewController];
    [vc setItem:itme3 bindViewController:ContactViewController1];

    CLFolderWindowController *folderWindowController = [[CLFolderWindowController alloc] init];
//    [vc setItem:itme4 bindWindowController:folderWindowController];
    [vc setItem:itme4 bindWindowControllerString:NSStringFromClass([folderWindowController class])];
    
    [vc showWindow];
  
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
