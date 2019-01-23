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
    private var initialCenter = CGPoint()
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
    
    /**
     Unused. Finding best way to Implement
     */
    func makeDrag(){
        let dragInteraction = UIPanGestureRecognizer(target: self, action: #selector(panRemove(_:)))
        dragInteraction.maximumNumberOfTouches = 1
        self.overlay.addGestureRecognizer(dragInteraction)
        
    }
    
    /**
     Not Properly Implemented
     */
    
    @objc func panRemove(_ gestureRecognizer: UIPanGestureRecognizer){
        guard let panView = gestureRecognizer.view else { return}
        let translation = gestureRecognizer.translation(in: panView.superview)
        
        if gestureRecognizer.state == .began{
            initialCenter = panView.center
        }
        
        if gestureRecognizer.state == .changed{
            let newCenter = CGPoint(x: initialCenter.x , y: initialCenter.y + translation.y)
            panView.center = newCenter
        }
        
        if gestureRecognizer.state == .ended{
            let dy = panView.center.y - center.y
            if  dy.magnitude > frame.height * 0.4{
                self.dismiss()
            }else{
                
            }
        }

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
