//
//  ViewController.swift
//  PPFIndicator
//
//  Created by 潘鹏飞 on 2019/6/10.
//  Copyright © 2019 JianDePu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let _ = {
            let v = PPFIndicator(itemWidth: 100, height: 30)
            v.setBackgroundColor(UIColor(hex: 0x00b25c))
            v.setFrontgroundColor(UIColor(hex: 0x0c5aa6))
            v.frame.origin = CGPoint(x: 10, y: 100)
            v.setUI(texts: ["AAAA","BBBB","cc"])
            v.setLabel(fonts: [UIFont.systemFont(ofSize: 16),UIFont.systemFont(ofSize: 12),UIFont.systemFont(ofSize: 20)])
            v.setBackgroundLabel(colors: [UIColor(red: 1, green: 0, blue: 0, alpha: 1),UIColor(red: 0, green: 1, blue: 0, alpha: 1),UIColor(red: 0, green: 0, blue: 1, alpha: 1)])
            v.setFrontgroundLabel(uniqueColor: UIColor(white: 1, alpha: 1))
            v.setFrontgroundColor(UIColor.purple)
            v.setCornerRadius(15)
            view.addSubview(v)
        }()
    }


}

