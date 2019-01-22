//
//  .swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 22/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.


import UIKit




public class ActivityLoaderView:UIView{
    
    var activity:UIActivityIndicatorView!
    var label:UILabel!
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = UIColor.darkText
        alpha = 0.75
        activity = UIActivityIndicatorView(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
        activity.center = CGPoint(x: center.x, y: center.y - 100)
        addSubview(activity)
        activity.style = .whiteLarge
        label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: frame.width - 32, height: 40)))
        label.center = center
        label.backgroundColor = .clear
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = "Loading, Please wait.."
        
        addSubview(label)
        activity.startAnimating()
    }

    /**
     *Use offset to vary distance between loader and the text below. Useful for loading view within a smaller subview.
     */
    public init(frame:CGRect,offset:CGFloat = 0, text:String? = nil){
        super.init(frame: frame)
        backgroundColor = UIColor.darkText
        alpha = 0.75
        activity = UIActivityIndicatorView(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
        activity.center = CGPoint(x: center.x, y: center.y - (100 - offset))
        addSubview(activity)
        activity.style = .whiteLarge
        label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: frame.width - 32, height: 40)))
        label.center = center
        label.backgroundColor = .clear
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = text ?? "Loading, Please wait.."
        
        addSubview(label)
        activity.startAnimating()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}



