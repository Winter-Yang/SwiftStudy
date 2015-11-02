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

        var _:UIImage
        self.leftButton(nil, hlIimage: nil, title: "返回", size: CGSize(width: 38, height: 30), action: "buttonClick", target: self)
        
        

//         let dic:Dictionary<String,String> = ["a":"1","b":"2"];
        
//        let getUrl:String = "http://m.weather.com.cn/atad/101190101.html"
        //post测试
//        RequestAPI.POST("getRechargeList", body: dic, succeed: succeed, failed:failed)
        //get测试
        RequestAPI.GET("http://m.weather.com.cn/atad/101190101.html", body: nil, succeed: succeed, failed: failed)
        
//        //文件上传
//        RequestAPI.uploadImage("http://m.weather.com.cn/atad/101190101", body: nil, imagePath: "file://sdnfnsdf.sfhsh.png", succeed: succeed, failed: failed)
//        // Do any additional setup after loading the view.
    }

    func succeed(task:NSURLSessionDataTask!,responseObject:AnyObject!)->Void{
        print("qwwqweqe+\(responseObject)")
    }
    
    func failed(task:NSURLSessionDataTask!,error:NSError!)->Void{
        print("失败了")
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
