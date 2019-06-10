//
//  UIColor+extension.swift
//  TestIndicator
//
//  Created by 潘鹏飞 on 2019/5/31.
//  Copyright © 2019 JianDePu. All rights reserved.
//

import UIKit

extension UIColor {
    /// 初始化color
    public convenience init(hex:UInt,alpha:CGFloat = 1.0) {
        let r = (hex & 0xff0000) >> 16
        let g = (hex & 0x00ff00) >> 8
        let b = (hex & 0xff)
        self.init(red: CGFloat(r) / 256.0, green: CGFloat(g) / 256.0, blue: CGFloat(b) / 256.0, alpha: alpha)
    }
}
