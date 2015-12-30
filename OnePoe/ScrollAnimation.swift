//
//  ScrollAnimation.swift
//  OnePoe
//
//  Created by wyatt on 15/12/29.
//  Copyright © 2015年 Wanqing Wang. All rights reserved.
//

import Foundation

let secScoll = 80.0


// 运行动画，顶行在下下位置，运行至下行到中间位置，完成之后，停 1 秒，再将其置于中间位置。
class ScrollAnimation: NSObject {
    class func contentLabelAnimationWithLabel(label: myUILabel, view: UIView) {
        let sec = Double(label.frame.size.height) / secScoll
        UIView.animateWithDuration(sec, delay: 1, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            var top: CGFloat = 0
            // Label 大小不一样，则使用不同的移动定位
            if label.frame.height < UIScreen.mainScreen().bounds.height {
                top = label.frame.size.height - UIScreen.mainScreen().bounds.height / 2 + 100
            } else {
                top = label.frame.size.height - UIScreen.mainScreen().bounds.height / 2
            }
                label.transform = CGAffineTransformMakeTranslation(0, -top)
            }, completion: { (f) -> Void in
                sleep(1)
                UIView.animateWithDuration(1.5, animations: { () -> Void in
                    // 移动到位置之后，对字幕进行重新定位
                    if label.frame.height > UIScreen.mainScreen().bounds.height {
                        label.transform = CGAffineTransformMakeTranslation(0, 10)
                    } else {
                        label.transform = CGAffineTransformMakeTranslation(0, (UIScreen.mainScreen().bounds.height - label.bounds.height) / 2 - 100)
                    }
                })
                
        })
        

    }
}

class PoeLabel: myUILabel {
    var textAttributes: [String: AnyObject]!
    
    convenience init(fontname: String, labelText: String, fontSize: CGFloat, lineHeight: CGFloat) {
        self.init(frame: CGRectZero)
        
        let font = UIFont(name: fontname, size: fontSize) as UIFont!
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        
        textAttributes = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle]
        let labelSize = (labelText as NSString).boundingRectWithSize(CGSizeZero, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textAttributes, context: nil)
        // 设定label的大小
        let _x = (UIScreen.mainScreen().bounds.width - labelSize.width) / 2
        self.frame = CGRectMake(_x, 0 , labelSize.width, labelSize.height)
        self.attributedText = NSAttributedString(string: labelText, attributes: textAttributes)
        self.lineBreakMode = NSLineBreakMode.ByCharWrapping
        self.numberOfLines = 0
        self.verticalAlignment = VerticalAlignmentTop
        self.textAlignment = .Center
        self.verticalAlignment = VerticalAlignmentTop
    }
}