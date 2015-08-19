//
//  BaseViewController.swift
//  SwiftStudy
//
//  Created by 杨雯德 on 15/8/18.
//  Copyright (c) 2015年 杨雯德. All rights reserved.
//

import UIKit

func kDeviceWidth()->CGFloat{
   
    return UIScreen.mainScreen().bounds.size.width

}

func kDeviceHeight()->CGFloat{
    
    return UIScreen.mainScreen().bounds.size.height
    
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //设置NavigationBar TitleView
    func titleView(image:UIImage,title:String){
        var customView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 27))
        customView.center = CGPoint(x: kDeviceWidth()/2-2, y: 20)
        customView.backgroundColor = UIColor.clearColor()
        if image != NSNull(){
            var aa:UIImageView = UIImageView(frame: CGRect(x: 0, y: 2, width:222, height: 25))
            aa.image = image
            aa.userInteractionEnabled = true
            customView.addSubview(aa)
            self.navigationItem.titleView = customView
        }else if title != NSNull(){
            var aa:UILabel = UILabel(frame: CGRect(x: 0, y: 2, width: 150, height: 25))
            aa.userInteractionEnabled = true
            aa.text = title
            aa.textAlignment = NSTextAlignment.Center
            aa.font = UIFont.systemFontOfSize(15)
            aa.backgroundColor = UIColor.clearColor()
            aa.textColor = UIColor.whiteColor()
            customView.addSubview(aa)
            self.navigationItem.titleView = customView
        }
    
    }
    //设置 左按钮
    
    func leftButton(image:UIImage?,hlIimage:UIImage?,title:String,size:CGSize,action:Selector,target:AnyObject){
        
        if image != nil{
            var fonesize:CGFloat = 0
            var leftNavButton = self.buttonCreat(CGRectMake(0,0,size.width, size.height), title:"", alignment: NSTextAlignment.Center, target: target, myaction: action, normalImage: image!, hightImage: hlIimage!, fonsize:fonesize)
            var sendButtonItem = UIBarButtonItem(customView: leftNavButton)
            self.navigationItem.leftBarButtonItem = sendButtonItem
        }else{
            var fonesize:CGFloat = 15
            var leftNavButton = self.buttonCreat(CGRectMake(0,0,size.width, size.height), title:title, alignment: NSTextAlignment.Center, target: target, myaction: action, normalImage: UIImage(), hightImage: UIImage(), fonsize:fonesize)
            var sendButtonItem = UIBarButtonItem(customView: leftNavButton)
            self.navigationItem.leftBarButtonItem = sendButtonItem
        }
        
    }
    
    
    //设置 右按钮
    func rightButton(image:UIImage?,hlIimage:UIImage?,title:String,size:CGSize,action:Selector,target:AnyObject){
        
        if image != nil{
            var fonesize:CGFloat = 0
            var rightNavButton = self.buttonCreat(CGRectMake(0,0,size.width, size.height), title:"", alignment: NSTextAlignment.Center, target: target, myaction: action, normalImage: image!, hightImage: hlIimage!, fonsize:fonesize)
            var sendButtonItem = UIBarButtonItem(customView: rightNavButton)
            self.navigationItem.rightBarButtonItem = sendButtonItem
        }else{
            var fonesize:CGFloat = 15
            var rightNavButton = self.buttonCreat(CGRectMake(0,0,size.width, size.height), title:title, alignment: NSTextAlignment.Center, target: target, myaction: action, normalImage: UIImage(), hightImage: UIImage(), fonsize:fonesize)
            var sendButtonItem = UIBarButtonItem(customView: rightNavButton)
            self.navigationItem.rightBarButtonItem = sendButtonItem
        }
        
    }
    
    
    
    
        
    //button创建
    func buttonCreat(frame:CGRect,title:String,alignment:NSTextAlignment,target:AnyObject ,myaction:Selector,normalImage:UIImage,hightImage:UIImage,fonsize:CGFloat)->UIButton{
            
            var button:UIButton! = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
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
