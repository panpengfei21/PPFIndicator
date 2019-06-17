# 效果
![示例](https://upload-images.jianshu.io/upload_images/2261768-cb94cf9d43c9df9a.gif?imageMogr2/auto-orient/strip)

# 引用
1. cocoapods
```
pod 'PPFIndicator'
```
2. 直接把sources里的文件拷贝到你的项目里
```
`PPFIndicator.swift`
`PPFIndicatorbackgroundV.swift`
```

# 怎么用

```
import PPFIndicator
```
```
let v = PPFIndicator(itemWidth: 100, height: 30)
//设置背景色
v.setBackgroundColor(UIColor.red)
// 设置前景色
v.setFrontgroundColor(UIColor.blue)
// 设置显示的文字
v.setUI(texts: ["AAAA","BBBB","cc"])
/// 设置字体
v.setLabel(fonts: [UIFont.systemFont(ofSize: 16),UIFont.systemFont(ofSize: 12),UIFont.systemFont(ofSize: 20)])
/// 设置前
v.setBackgroundLabel(colors: [UIColor(red: 1, green: 0, blue: 0, alpha: 1),UIColor(red: 0, green: 1, blue: 0, alpha: 1),UIColor(red: 0, green: 0, blue: 1, alpha: 1)])
/// 设置统一的前景字体
v.setFrontgroundLabel(uniqueColor: UIColor.white)
/// 设置统一的前景字颜色
v.setFrontgroundColor(UIColor.purple)
/// 设置圆角
v.setCornerRadius(15)
view.addSubview(v)
```
