//
//  CostomNavigationVC.swift
//  SwiftStudy
//
//  Created by 杨雯德 on 15/8/17.
//  Copyright (c) 2015年 杨雯德. All rights reserved.
//

import UIKit

func hexRGB(rgbValue:Int) ->UIColor{
    let r = CGFloat((rgbValue & 0xffffff) >> 16)/255.0
    let g = CGFloat((rgbValue & 0xFF00) >> 8)/255.0
    let b = CGFloat(rgbValue & 0xFF)/255.0
    return  UIColor(red: r, green: g, blue: b, alpha: 1)
}

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor {
    return UIColor(red: r/255.0, green: r/255.0, blue: r/255.0, alpha: 1.0)
//    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

class CostomNavigationVC: UINavigationController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackImage()
    }

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController);
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackImage(){
        let backImage:UIImage! = self.imageWithColor(hexRGB(0x00a0ff))
        self.navigationBar.setBackgroundImage(backImage, forBarMetrics:UIBarMetrics.Default)
    }
    
    
    func imageWithColor(color:UIColor) ->UIImage{
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let contrxt:CGContextRef! = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(contrxt, color.CGColor)
        CGContextFillRect(contrxt, rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }
    
    //设置不可点击的titleView
    func setTitle(title:String, hasbadge:Bool){
        
        let titleLabel:UILabel! = UILabel()
        var frame = titleLabel.frame
        frame.size.width = frame.size.width + 50
        frame.size.height = frame.size.height + 10
        titleLabel.frame = frame
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.text = title
        titleLabel.font = UIFont(name: "STHeitiSC-Medium", size: 18)
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.sizeToFit()

        if(NSArray(array: self.viewControllers).lastObject != nil){
            let vc:UIViewController = self.viewControllers.last! as UIViewController
            vc.navigationItem.titleView = titleLabel
        }
    }
    
    //设置可点击的titleView
    func setTitle(title:String, action:Selector, target:AnyObject){
        let frame:CGRect = CGRect(x: 0.0, y: 0.0, width: 120.0, height: 44.0)
        let foneSize:CGFloat = 12

        let button:UIButton  = self.buttonCreat(frame, title:title, alignment: NSTextAlignment.Center, target: target, myaction: action, normalImage:UIImage(), hightImage:UIImage(), fonsize: foneSize)
        if(NSArray(array: self.viewControllers).lastObject != nil){
            let vc:UIViewController = self.viewControllers.last! as UIViewController
            vc.navigationItem.titleView = button
        }
   
    }
    
    //左按钮
    func leftButton(image:UIImage ,hightImage:UIImage, size:CGSize , action:Selector ,target:AnyObject){
        let frame:CGRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        let foneSize:CGFloat = 12
        if image != NSNull() {
            
            _ = self.buttonCreat(frame, title: "", alignment: NSTextAlignment.Center, target: target, myaction: action, normalImage: image, hightImage: hightImage, fonsize: foneSize)
        }else{
          
            _ = self.buttonCreat(frame, title: "", alignment: NSTextAlignment.Center, target: target, myaction: action, normalImage: image, hightImage: hightImage, fonsize: foneSize)
        }
    }
    
    
    //button创建
    func buttonCreat(frame:CGRect,
                     title:String,
                     alignment:NSTextAlignment,
                     target:AnyObject ,
                     myaction:Selector,
                     normalImage:UIImage,
                     hightImage:UIImage,
                     fonsize:CGFloat)->UIButton{
        
        let button:UIButton! = UIButton(type: UIButtonType.Custom);// UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        button.frame = frame
        button.backgroundColor = UIColor.clearColor()
        button.titleLabel?.font = UIFont.systemFontOfSize(fonsize)
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor(hexRGB(0x807f7f), forState: UIControlState.Normal)
        button.setTitleColor(hexRGB(0xffca00), forState: UIControlState.Highlighted)
        
        button.setBackgroundImage(normalImage, forState: UIControlState.Normal)
        button.setBackgroundImage(hightImage, forState: UIControlState.Highlighted)
        button.addTarget(target, action: myaction, forControlEvents: UIControlEvents.TouchDragInside)
        return button
        
    }
    
    
    
    
    
    
    /**
    + (UIImage *) imageWithColor:(UIColor *)color
    {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
