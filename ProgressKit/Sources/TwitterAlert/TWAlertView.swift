//
//  TWAlertView.swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 23/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import UIKit

public class TWAlertView:UIView{
    
    private var baseAlertView:BaseAlertController!
    private var overlay:UIView!
    private var icons:[UIImage]?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    public init(options:TWAlertOptions){
        let frame = UIScreen.main.bounds
        super.init(frame: frame)
        baseAlertView = BaseAlertController(options: options)
        baseAlertView.dismissMethod = dismiss
        overlay = UIView(frame: frame)
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        backgroundColor = UIColor.clear
        overlay.backgroundColor = .darkGray
        overlay.alpha = 0.5
        addSubview(overlay)
        addSubview(baseAlertView)
        baseAlertView.showSelf()
    }
    
    
    
    public func show(){
        //Sun0lz1
    }
    
    public func dismiss(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
            self.baseAlertView.frame.origin.y += self.baseAlertView.height
        }) { (sucess) in
            
        }
        UIView.animate(withDuration: 0.5, animations: {
             self.overlay.alpha = 0
        }) { (suc) in
            self.overlay.removeFromSuperview()
            self.removeFromSuperview()
            self.baseAlertView.frame.origin.y = self.baseAlertView.frame.origin.y + self.baseAlertView.height
        }
       
    }
}
