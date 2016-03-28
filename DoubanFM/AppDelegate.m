//
//  AppDelegate.m
//  DoubanFM
//
//  Created by cc on 16/3/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "AppDelegate.h"
#import "DoubanFM-Swift.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *loginButton;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userSuccessLogin:) name:@"UserLoginSuccessNotification" object:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)onLogin:(id)sender {
    DBFMClient *client = [DBFMClient sharedClient];
    if (!client.haveLogin) {
        LoginController *c = [[LoginController alloc] init];
        NSWindow *sheet = [NSWindow windowWithContentViewController:c];
        [sheet setStyleMask:[sheet styleMask] &~ NSResizableWindowMask];
        [self.window beginCriticalSheet:sheet completionHandler:NULL];
    }
}

- (void)userSuccessLogin: (NSNotification *)notif {
    [self.loginButton setTitle:[DBFMClient sharedClient].user.user_name];
}

@end
