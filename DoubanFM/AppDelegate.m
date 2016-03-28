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
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)onLogin:(id)sender {
    LoginController *c = [[LoginController alloc] init];
    NSWindow *sheet = [NSWindow windowWithContentViewController:c];
    [sheet setStyleMask:[sheet styleMask] &~ NSResizableWindowMask];
    [self.window beginCriticalSheet:sheet completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSModalResponseOK) {
            NSLog(@"Begin login: email[\"%@\"] | password[\"%@\"]", c.email, c.password);
        }else if (returnCode == NSModalResponseCancel) {
            NSLog(@"%@", @"Cancel Login");
        }
    }];
}

@end
