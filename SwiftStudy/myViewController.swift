//
//  myViewController.swift
//  SwiftStudy
//
//  Created by 杨雯德 on 15/8/18.
//  Copyright (c) 2015年 杨雯德. All rights reserved.
//

import UIKit

class myViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.brownColor()

        var image:UIImage
        self.leftButton(nil, hlIimage: nil, title: "返回", size: CGSize(width: 38, height: 30), action: "buttonClick", target: self)
        
        
        
        
         var dic:Dictionary<String,String> = ["appID":"621617408418775040","idfa":"A79F5A5E-4102-4BFB-9B20-48C3A058C55A","pageTime":"0","section":"7","token":"ab9e220cb716bb2942edc3ecd94cbb6a"];
        
        var getUrl:String = "http://m.weather.com.cn/atad/101190101.html"
        //post测试
        RequestAPI.POST("getRechargeList", body: dic, succeed: succeed, failed:failed)
        //get测试
        RequestAPI.GET("http://m.weather.com.cn/atad/101190101.html", body: nil, succeed: succeed, failed: failed)
        
        //文件上传
        RequestAPI.uploadImage("http://m.weather.com.cn/atad/101190101", body: nil, imagePath: "file://sdnfnsdf.sfhsh.png", succeed: succeed, failed: failed)
        // Do any additional setup after loading the view.
    }

    func succeed(task:NSURLSessionDataTask!,responseObject:AnyObject!)->Void{
        println("qwwqweqe+\(responseObject)")
    }
    
    func failed(task:NSURLSessionDataTask!,error:NSError!)->Void{
        println("失败了")
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
