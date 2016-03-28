//
//  DBFMClient.swift
//  DoubanFM
//
//  Created by cc on 16/3/28.
//  Copyright © 2016年 cc. All rights reserved.
//

import Cocoa
import SwiftyJSON

class User: NSObject {
    var user_id: String?
    var token: String?
    var expire: String?
    var user_name: String?
    var email: String?
    
    func updateWithJSON(dict: JSON) {
        self.user_id = dict["user_id"].string
        self.token = dict["token"].string
        self.expire = dict["expire"].string
        self.user_name = dict["user_name"].string
        self.email = dict["email"].string
    }
}

class DBFMClient: NSObject {
    static let sharedClient = DBFMClient()
    var user: User!
    
    override init() {
        super.init()
        user = User()
    }
}
