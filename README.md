# D3 Workshop
## Workshop Summary:
1. Create a **new Xcode project**.
2. Adding basic **storyboard elements** and constraints.
4. Adding and editing **view controllers** on the storyboard.
5. **Adding files** (such as **images**) to a project.
6. **Assigning Swift classes to view controllers**.
7. **Adding outlets** between storyboard elements and Swift classes.
8. **Basic Swift code** to change a label's text.
9. **Adding CocoaPods** to your project **(Using other developers' code)**.

## How To's:

**How to install CocoaPods:**

```
sudo gem install cocoapods
```

**How to init CocoaPods in your project:**

```
cd [PATH_TO_YOUR_PROJECT]
pod init
```

**How should your Podfile look like for the HelloWorld project:**

```
platform :ios, "8.0"
use_frameworks!

target 'HelloWorld' do

    pod 'SwiftyJSON', '~> 2.2.1'

    pod 'Alamofire', '~> 1.3'
    
    pod 'BrightFutures'

end

target 'HelloWorldTests' do

end
```

**How to install your Pods after adding them to your Podfile**

```
pod install
```

**Code to show trending topics:**

```
let url = "[TRENDS_URL (see below)]"
        
request(.GET, url).responseJSON { (_, _, object, _) -> Void in
            
    Queue.main.async {
                
        if let obj:AnyObject = object {
                    
            let json = JSON(obj)
                    
            self.contentLabel.text = "\n".join(json["trends"].arrayValue.map{$0["name"].stringValue})
                    
        }else {
            self.contentLabel.text = "ERROR"
        }
                
    }
            
}
```


## Links and Images:
[Download Xcode](https://developer.apple.com/xcode/)

[Refresh Icon](https://raw.githubusercontent.com/wircho/D3Workshop/master/HelloWorld/HelloWorld/refresh@2x.png)

![](https://raw.githubusercontent.com/wircho/D3Workshop/master/HelloWorld/HelloWorld/refresh@2x.png)

[Montréal Logo](https://raw.githubusercontent.com/wircho/D3Workshop/master/HelloWorld/HelloWorld/montreal@2x.png)

![](https://raw.githubusercontent.com/wircho/D3Workshop/master/HelloWorld/HelloWorld/montreal@2x.png)

[World Logo](https://raw.githubusercontent.com/wircho/D3Workshop/master/HelloWorld/HelloWorld/world@2x.png)

![](https://raw.githubusercontent.com/wircho/D3Workshop/master/HelloWorld/HelloWorld/world@2x.png)

Montréal Trends:

`http://api.whatthetrend.com/api/v2/trends.json?woeid=3534`

World Trends:

`http://api.whatthetrend.com/api/v2/trends.json`




