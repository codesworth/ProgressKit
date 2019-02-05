//
//  SnackBar.swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 01/02/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import UIKit

public class SnackBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public class func makeSnackIn(_ parent:UIView, text:String, color:UIColor = .seafoamBlue){
        let snackbar = SnackBar(frame: CGRect(x: 0, y: parent.frame.height, width: parent.frame.width, height: 50))
        snackbar.backgroundColor = color
        parent.addSubview(snackbar)
        let label = UILabel(frame: CGRect(x: 12, y: 0, width: parent.frame.width, height: 50))
        snackbar.addSubview(label)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.backgroundColor = .clear
        label.text = text
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
            snackbar.frame.origin.y -= 50
        })
        UIView.animate(withDuration: 0.5, delay: 6, options: .curveEaseOut, animations: {
            snackbar.frame.origin.y += 50
        }) { (success) in
            snackbar.removeFromSuperview()
        }
    }
}
