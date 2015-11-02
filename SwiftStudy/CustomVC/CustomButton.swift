//
//  CustomButton.swift
//  SwiftStudy
//
//  Created by 杨雯德 on 15/8/17.
//  Copyright (c) 2015年 杨雯德. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageW:CGFloat = contentRect.size.width
        let imageH:CGFloat = contentRect.size.height
        return CGRectMake(0, 5, imageW, imageH)
    }

    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleY:CGFloat = contentRect.size.height * 0.7
        let titleW:CGFloat = contentRect.size.width
        let titleH:CGFloat = contentRect.size.height - titleW
        return CGRectMake(0, titleY, titleW, titleH);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
