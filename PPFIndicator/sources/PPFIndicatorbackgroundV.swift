//
//  PPFIndicatorbackgroundV.swift
//  TestIndicator
//
//  Created by 潘鹏飞 on 2019/5/31.
//  Copyright © 2019 JianDePu. All rights reserved.
//

import UIKit

class PPFIndicatorbackgroundV: UIView {
    private var labels:[UILabel] = []
    
    func setupUI(titles:[String],textColor:UIColor) {
        for sb in labels {
            sb.removeFromSuperview()
        }
        labels = []
        labels = titles.compactMap(){
            let l = UILabel()
            l.font = UIFont.systemFont(ofSize: 10)
            l.textColor = textColor
            l.textAlignment = .center
            l.text = $0
            l.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(l)
            return l
        }
        
        initializeConstraints(views: labels)
    }
    
    private func initializeConstraints(views:[UIView]) {
        for i in 0 ..< views.count {
            if i == 0 {
                views[i].leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            }else{
                views[i].leftAnchor.constraint(equalTo: views[i - 1].rightAnchor).isActive = true
                views[i].widthAnchor.constraint(equalTo: views[i - 1].widthAnchor).isActive = true
            }
            if i == views.count - 1 {
                views[i].rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            }
            views[i].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            views[i].bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    /// 显示几号label,,which index of label to be show
    func showIndex(_ index:Int) {
        guard index < subviews.count && index >= 0 else{
            return
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.mask?.frame.origin = self.subviews[index].frame.origin
        }, completion: nil)
    }
    
    /// 设置labels的不同颜色
    /// set up labels different colors,number of colors must be equal to number of number of labels
    open func setColors(_ colors:[UIColor]){
        guard colors.count == labels.count else{
            fatalError("PPFIndicatorbackgroundV:->number of labels not equals to number of colors")
        }
        for i in 0 ..< labels.count {
            labels[i].textColor = colors[i]
        }
    }
    
    
    /// 设置统一的颜色.set up labels text color use unqiue color
    open func setUniqueColor(_ color:UIColor){
        labels.forEach(){
            $0.textColor = color
        }
    }
    
    /// 设置labels的不同字体
    /// set up labels different fonts,number of fonts must be equal to number of number of labels
    open func setFonts(_ fonts:[UIFont]){
        guard fonts.count == labels.count else{
            fatalError("PPFIndicatorbackgroundV:->number of labels not equals to number of fonts")
        }
        for i in 0 ..< fonts.count {
            labels[i].font = fonts[i]
        }
    }
    
    /// 设置统一的字体.set up labels text font use unqiue font
    open func setUniqueFont(_ font:UIFont){
        labels.forEach(){
            $0.font = font
        }
    }
}

