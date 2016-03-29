//
//  LoginController.swift
//  DoubanFM
//
//  Created by cc on 16/3/28.
//  Copyright © 2016年 cc. All rights reserved.
//

import Cocoa
import Alamofire
import SwiftyJSON

class LoginController: NSViewController {
    
    var email = ""
    var password = ""

    deinit {
        print("\(LoginController.self): deinit")
    }
    
    override func viewDidLoad() {
        if #available(OSX 10.10, *) {
            super.viewDidLoad()
        } else {
            // Fallback on earlier versions
        }
        // Do view setup here.
    }
    
    @IBAction func onBtn(sender: NSButton) {
        self.view.window?.makeFirstResponder(sender)
        let tag = sender.tag
        if tag == 0 {
            self.dismissSheet()
        }else {
            self.beginLogin()
        }
    }
    
    private func dismissSheet() {
        self.view.window?.sheetParent?.endSheet(self.view.window!)
    }
    
    func beginLogin() {
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
//        hud.mode = MBProgressHUDModeAnnularDeterminate
        let params = ["app_name": "radio_android", "version": "100", "email": "\(self.email)", "password": "\(self.password)"]
        Alamofire.request(.POST, "https://www.douban.com/j/app/login", parameters: params).responseJSON { (response) -> Void in
            hud.hide(true)
            var errmsg = "网络错误，请检查网络设置."
            if response.result.isSuccess {
                if let data = response.data {
                    let json = JSON(data: data)
                    if json["r"].stringValue == "0" {
                        // success
                        DBFMClient.sharedClient.user.updateWithJSON(json)
                        NSNotificationCenter.defaultCenter().postNotificationName(UserLoginSuccessNotification, object: DBFMClient.sharedClient)
                        self.dismissSheet()
                        return
                    }else {
                        errmsg = json["err"].stringValue
                    }
                }
            }// isSuccess
            NSTextField.showHUDInView(self.view, text: errmsg)
        }// response
    }// beginLogin
}
