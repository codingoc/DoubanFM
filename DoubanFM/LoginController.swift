//
//  LoginController.swift
//  DoubanFM
//
//  Created by cc on 16/3/28.
//  Copyright © 2016年 cc. All rights reserved.
//

import Cocoa

class LoginController: NSViewController {
    
    var email = ""
    var password = ""

    deinit {
        print("\(LoginController.self): deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func onBtn(sender: NSButton) {
        self.view.window?.makeFirstResponder(sender)
        self.view.window?.sheetParent?.endSheet(self.view.window!, returnCode: sender.tag)
    }
}
