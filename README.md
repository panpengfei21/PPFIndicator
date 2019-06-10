# 效果
![示例](https://upload-images.jianshu.io/upload_images/2261768-cb94cf9d43c9df9a.gif?imageMogr2/auto-orient/strip)

# 怎么用
```
            let v = PPFIndicator(itemWidth: 100, height: 30)
            v.setBackgroundColor(UIColor.red)
            v.setFrontgroundColor(UIColor.blue)
            v.frame.origin = CGPoint(x: 10, y: 100)
            v.setUI(texts: ["AAAA","BBBB","cc"])
            v.setLabel(fonts: [UIFont.systemFont(ofSize: 16),UIFont.systemFont(ofSize: 12),UIFont.systemFont(ofSize: 20)])
            v.setBackgroundLabel(colors: [UIColor(red: 1, green: 0, blue: 0, alpha: 1),UIColor(red: 0, green: 1, blue: 0, alpha: 1),UIColor(red: 0, green: 0, blue: 1, alpha: 1)])
            v.setFrontgroundLabel(uniqueColor: UIColor.white)
            v.setFrontgroundColor(UIColor.purple)
            v.setCornerRadius(15)
            view.addSubview(v)

```
