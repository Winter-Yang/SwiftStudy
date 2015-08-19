//
//  RequestClient.swift
//  SwiftStudy
//
//  Created by 杨雯德 on 15/8/19.
//  Copyright (c) 2015年 杨雯德. All rights reserved.
//

import UIKit



class RequestClient: AFHTTPSessionManager {
    
    class var sharedInstance :RequestClient {
        struct Static {
            static var onceToken:dispatch_once_t = 0
            static var instance:RequestClient? = nil
        }
        
        dispatch_once(&Static.onceToken, { () -> Void in

            //在这里设置你的baseURl
            var url:NSURL = NSURL(string: "")!
            Static.instance = RequestClient(baseURL: url)
        })
        return Static.instance!
        
    }

}
