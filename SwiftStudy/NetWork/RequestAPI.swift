//
//  RequestAPI.swift
//  SwiftStudy
//
//  Created by 杨雯德 on 15/8/19.
//  Copyright (c) 2015年 杨雯德. All rights reserved.
//





/**
    RequestClient.sharedInstance.POST(url, parameters: body, success: succeed, failure: succeed)
    RequestClient.sharedInstance.requestSerializer = AFJSONRequestSerializer()
    RequestClient.sharedInstance.responseSerializer = AFJSONResponseSerializer()
    RequestClient.sharedInstance.requestSerializer.setValue("application/json,text/html", forHTTPHeaderField: "Accept")
    RequestClient.sharedInstance.requestSerializer.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

*/
import UIKit

typealias Succeed = (NSURLSessionDataTask!,AnyObject!)->Void

typealias Failure = (NSURLSessionDataTask!,NSError!)->Void

class RequestAPI: NSObject {
    
    //普通post网络请求
    class func POST(url:String!,body:AnyObject?,succeed:Succeed,failed:Failure) {
        
        
        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed
        
        RequestClient.sharedInstance.POST(url, parameters: body, success: { (task:NSURLSessionDataTask!, responseObject:AnyObject!)  in
            mysucceed(task,responseObject)
            }){ (task:NSURLSessionDataTask!, error:NSError!) in
            myfailure(task,error)
        }
 
    }
    //普通get网络请求
    class func GET(url:String!,body:AnyObject?,succeed:Succeed,failed:Failure) {

        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed

        RequestClient.sharedInstance.GET(url, parameters: nil, success: { (task:NSURLSessionDataTask!, responseObject:AnyObject!) in

            mysucceed(task,responseObject)
            
            }) { (task:NSURLSessionDataTask!, error:NSError!) in
                myfailure(task,error)
        }
  
    }
    //上传图片
    
    class func  uploadImage(url:String,body:Dictionary<String,String>?,imagePath:String,succeed:Succeed,failed:Failure) {
        //根据图片链接获取图片名称

        let iamgeName:String! = RequestAPI.uploadName(imagePath)
        RequestAPI.requestUrl(url, body: body, imagePath: imagePath, filePath: nil, name:iamgeName , succeed: succeed, failed: failed)
    }
    
    
    
    //上传文件
    
    class func  uploadFile(url:String,body:Dictionary<String,String>?,filePath:String,succeed:Succeed,failed:Failure) {
        //根据文件链接获取文件名称

        let fileName:String! = RequestAPI.uploadName(filePath)
        RequestAPI.requestUrl(url, body: body, imagePath: nil, filePath:filePath, name:fileName , succeed: succeed, failed: failed)
    }
    //获取图片/文件名
    class func uploadName(path:String?)->String {
//        var uploadFilePath:String = String(stringInterpolationSegment: path).hasSuffix
//        let spliteArray = split(uploadFilePath){
//            $0=="."
//        }
//        
//        let spliteArray = (String,(String) -> BOOL){
//            $0=="."
//        }
        
        
        let spliteArray = path!.componentsSeparatedByString(".")
        
        let filesplite:String! = spliteArray.first!
        
        let fileNamepliteArray = filesplite!.componentsSeparatedByString("/")
        
        let fileName:String = fileNamepliteArray.last!
        
        return fileName
    }

    //上传操作
    class func requestUrl(url:String,body:Dictionary<String,String>?,imagePath:String?,filePath:String?,name:String,succeed:Succeed,failed:Failure) {
        
        
        let uploadImagePath:String! = String(stringInterpolationSegment: imagePath)
        let uploadFilePath:String! = String(stringInterpolationSegment: filePath)
//        let parameters:Dictionary! = body
        
        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed


            if uploadImagePath != nil{
                
                let image:UIImage! = UIImage(contentsOfFile:uploadImagePath)
                
                if image != NSNull() {
                    
                    let imageData:NSData! = UIImageJPEGRepresentation(image, 1.0)
                    
                    RequestClient.sharedInstance.POST(url, parameters: body, constructingBodyWithBlock: { (formData:AFMultipartFormData!) in
                        if imageData != nil{
                            formData.appendPartWithFileData(imageData, name: "upload", fileName: "upload", mimeType: "image/jpeg")
                        }

                        }, success: { (task:NSURLSessionDataTask!, responseObject:AnyObject!)in
                            
                            mysucceed(task,responseObject)
                            
                        }, failure: { (task:NSURLSessionDataTask!, error:NSError!)in
                            
                            myfailure(task,error)
                    })
                }
            }else if uploadFilePath != nil{
                var url:NSURL! = NSURL(string: "http://example.com/upload")
                var request:NSURLRequest! = NSURLRequest(URL: url)
                var fileUrl:NSURL! = NSURL(fileURLWithPath: uploadFilePath)
                
                var uploadTask:NSURLSessionUploadTask = RequestClient.sharedInstance.uploadTaskWithRequest(request, fromFile: fileUrl, progress: AutoreleasingUnsafeMutablePointer<NSProgress?>(), completionHandler: { (response, responseObject, error) in
                    
                    
                })
                uploadTask.resume()
      
        }
        
    }
  
}
