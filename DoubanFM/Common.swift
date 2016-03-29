//
//  Common.swift
//  DoubanFM
//
//  Created by cc on 16/3/29.
//  Copyright © 2016年 cc. All rights reserved.
//

import Cocoa

extension NSView {
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            let rect = CGRectMake(newValue, self.y, self.width, self.height)
            self.frame = rect
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            let rect = CGRectMake(self.x, newValue, self.width, self.height)
            self.frame = rect
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            let rect = CGRectMake(self.x, self.y, newValue, self.height)
            self.frame = rect
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.height
        }
        set {
            let rect = CGRectMake(self.x, self.y, self.width, newValue)
            self.frame = rect
        }
    }
    
    var centerX: CGFloat {
        get {
            return (self.x+self.width)*0.5
        }
        set {
            let rect = CGRectMake(newValue-self.width*0.5, self.y, self.width, self.height)
            self.frame = rect
        }
    }
    
    var centerY: CGFloat {
        get {
            return (self.y+self.height)*0.5
        }
        set {
            let rect = CGRectMake(self.x, newValue-self.height*0.5, self.width, self.height)
            self.frame = rect
        }
    }
}

extension NSTextField {
    class func showHUDInView(view: NSView, text: String, autoFade: Bool = true, textColor: NSColor = NSColor.whiteColor()) -> NSTextField {
        let textField = NSTextField(frame: CGRectMake(0, 0, 10, 10))
        textField.bezeled = false
        textField.textColor = textColor
        textField.wantsLayer = true
        textField.layer?.cornerRadius = 2
        textField.stringValue = text
        textField.sizeToFit()
        textField.centerX = view.width*0.5
        textField.centerY = view.height*0.5
        textField.backgroundColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.addSubview(textField)
        if autoFade {
            NSAnimationContext.runAnimationGroup({ (context) in
                context.duration = 2.5
                textField.animator().alphaValue = 0
                }, completionHandler: { 
                    textField.removeFromSuperview()
            })
        }
        
        return textField
    }
}