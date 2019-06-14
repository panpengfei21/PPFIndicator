//
//  PPFIndicator.swift
//  TestIndicator
//
//  Created by 潘鹏飞 on 2019/5/31.
//  Copyright © 2019 JianDePu. All rights reserved.
//

import UIKit

@objc public protocol PPFIndicator_delegate:class {
    func ppfIndicator(view:PPFIndicator,didSelected index:Int)
}


@objc public class PPFIndicator: UIView {
    /// 一个item的宽度
    let itemWidth:CGFloat
    /// 高度
    let height:CGFloat
    
    private weak var backgroundView:PPFIndicatorbackgroundV!
    private weak var frontgroundView:PPFIndicatorbackgroundV!
    
    private var buttons:[UIButton] = []
    
    public weak var delegate:PPFIndicator_delegate?
    
    @objc public init(itemWidth:CGFloat,height:CGFloat) {
        self.itemWidth = itemWidth
        self.height = height
        super.init(frame: CGRect.zero)
        initializeUIs()
        initializeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initializeUIs() {
        self.backgroundColor = UIColor.clear
        backgroundView = {
            let v = PPFIndicatorbackgroundV()
            v.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(v)
            return v
        }()
        frontgroundView = {
            let v = PPFIndicatorbackgroundV()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            v.mask = UIView()
            v.mask?.clipsToBounds = true
            v.mask?.backgroundColor = UIColor.black
            
            self.addSubview(v)
            return v
        }()
    }
    
    private func initializeConstraints() {
        frontgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        frontgroundView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        frontgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        frontgroundView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    /// 设置UI,分别显示什么文字
    @objc open func setUI(texts:[String]) {
        backgroundView.setupUI(titles: texts, textColor: UIColor.black)
        frontgroundView.setupUI(titles: texts, textColor: UIColor.white)
        
        frontgroundView.mask?.frame.size = CGSize(width: itemWidth, height: height)
        self.frame.size = CGSize(width: CGFloat(texts.count) * itemWidth, height: height)
        
        for b in buttons {
            b.removeFromSuperview()
        }
        
        buttons = texts.compactMap(){_ in
            let b = UIButton(type: UIButton.ButtonType.custom)
            b.translatesAutoresizingMaskIntoConstraints = false
            b.addTarget(self, action: #selector(tap(button:)), for: .touchUpInside)
            self.addSubview(b)
            return b
        }
        
        for i in 0 ..< buttons.count {
            if i == 0 {
                buttons[i].leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            }else{
                buttons[i].leftAnchor.constraint(equalTo: buttons[i - 1].rightAnchor).isActive = true
                buttons[i].widthAnchor.constraint(equalTo: buttons[i - 1].widthAnchor).isActive = true
            }
            if i == buttons.count - 1 {
                buttons[i].rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            }
            buttons[i].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            buttons[i].bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    @objc private func tap(button:UIButton){
        guard let index = buttons.firstIndex(of: button) else{
            return
        }
        selectItemAtIndex(index)
        delegate?.ppfIndicator(view: self, didSelected: index)
    }
    
    /// 选择哪个索引
    @objc open func selectItemAtIndex(_ index:Int) {
        frontgroundView.showIndex(index)
        delegate?.ppfIndicator(view: self, didSelected: index)
    }
    /// 设置圆角的半径
    @objc open func setCornerRadius(_ radius:CGFloat){
        frontgroundView.mask?.layer.cornerRadius = radius
        backgroundView.layer.cornerRadius = radius
    }
    
    /// 设置背景label的颜色
    @objc open func setBackgroundLabel(colors:[UIColor]) {
        backgroundView.setColors(colors)
    }
    
    /// 设置背景label的颜色
    @objc open func setBackgroundLabel(unqiueColor:UIColor) {
        backgroundView.setUniqueColor(unqiueColor)
    }
    
    /// 设置前景字体颜色
    @objc open func setFrontgroundLabel(colors:[UIColor]){
        frontgroundView.setColors(colors)
    }
    /// 设置统一的前景字体颜色
    @objc open func setFrontgroundLabel(uniqueColor:UIColor){
        frontgroundView.setUniqueColor(uniqueColor)
    }
    /// 设置前景颜色
    @objc open func setFrontgroundColor(_ color:UIColor){
        frontgroundView.backgroundColor = color
    }
    /// 设置背景颜色
    @objc(setIndicatorBackgroundColor:) open func setBackgroundColor(_ color:UIColor){
        backgroundView.backgroundColor = color
    }
    /// 设置文字的字体
    @objc open func setLabel(fonts:[UIFont]){
        backgroundView.setFonts(fonts)
        frontgroundView.setFonts(fonts)
    }
    /// 设置文字的统一字体
    @objc open func setLabel(uniqueColor:UIFont){
        backgroundView.setUniqueFont(uniqueColor)
        frontgroundView.setUniqueFont(uniqueColor)
    }
}

