//
//  ViewController.swift
//  OnePoe
//
//  Created by wyatt on 15/12/29.
//  Copyright © 2015年 Wanqing Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var myLabel: PoeLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create label
        let poeText = "面朝大海，春暖花开\n从明天起，做一个幸福的人\n劈柴，周游世界\n从明天起，关心粮食和蔬菜\n我有一所房子，面朝大海，春暖花开\n从明天起，和每一个亲人通信\n告诉他们我的幸福\n那幸福的闪电告诉我的\n我将告诉每一个人\n给每一条河每一座山取一个温暖的名字\n陌生人，我也为你祝福\n愿你有一个灿烂的前程\n愿你有情人终成眷属\n愿你在尘世获得幸福\n我只愿面朝大海，春暖花开\n面朝大海，春暖花开\n从明天起，做一个幸福的人\n劈柴，周游世界\n从明天起，关心粮食和蔬菜\n我有一所房子，面朝大海，春暖花开\n从明天起，和每一个亲人通信\n告诉他们我的幸福\n那幸福的闪电告诉我的\n我将告诉每一个人\n给每一条河每一座山取一个温暖的名字\n陌生人，我也为你祝福\n愿你有一个灿烂的前程\n愿你有情人终成眷属\n愿你在尘世获得幸福\n我只愿面朝大海，春暖花开"
//        let poeText = "单车欲问边，属国过居延。 \n征蓬出汉塞，归雁入胡天。 \n大漠孤烟直，长河落日圆。 \n萧关逢候骑，都护在燕然。"
//        let poeText = "从明天起，做一个幸福的人\n劈柴，周游世界\n从明天起，关心粮食和蔬菜\n我有一所房子，面朝大海，春暖花开\n从明天起，和每一个亲人通信\n告诉他们我的幸福\n那幸福的闪电告诉我的\n我将告诉每一个人\n给每一条河每一座山取一个温暖的名字\n陌生人，我也为你祝福\n愿你有一个灿烂的前程\n愿你有情人终成眷属\n愿你在尘世获得幸福\n我只愿面朝大海，春暖花开"
        myLabel = PoeLabel(fontname: "FZBYSK--GBK1-0", labelText: poeText, fontSize: 17, lineHeight: 14)
        
        myLabel.transform = CGAffineTransformMakeTranslation(0, self.scrollView.bounds.height * 2 / 3)
        self.scrollView.addSubview(myLabel)

        var labelSize = CGSizeZero
        if myLabel.bounds.height < UIScreen.mainScreen().bounds.height {
            labelSize = CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 100)
        } else {
            labelSize = CGSizeMake(myLabel.frame.size.width, myLabel.frame.size.height )
            
        }
        
        self.scrollView.contentSize = labelSize
        
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        ScrollAnimation.contentLabelAnimationWithLabel(myLabel, view: self.view)
    }

}


//extension ViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        if myLabel.frame.height > UIScreen.mainScreen().bounds.height {
//            myLabel.transform = CGAffineTransformMakeTranslation(0, 10)
//        } else {
//            myLabel.transform = CGAffineTransformMakeTranslation(0, (UIScreen.mainScreen().bounds.height - myLabel.bounds.height) / 2 - 100)
//        }
//        
//    }
//    
//}