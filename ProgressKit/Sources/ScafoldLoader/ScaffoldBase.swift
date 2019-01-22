//
//  ScaffoldBase.swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 22/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import UIKit



public class ScaffoldBase:UIView{
    
    private var gradientLayer:CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        let colors:[CGColor] = [.mat_gray, .mat_gray2, .mat_gray]
        gradient.colors = colors
        gradient.locations = [0.25,0.50,0.75]
        return gradient
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func commonInit(){
        layer.cornerRadius = 8
        
    }
    
    
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        layer.addSublayer(gradientLayer)
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.00,0.00,0.25]
        gradientAnimation.toValue = [0.75,1.0,1.0]
        gradientAnimation.duration = 2.0
        gradientAnimation.repeatCount = .infinity
        gradientAnimation.autoreverses = autoReverse()
        gradientAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        gradientLayer.add(gradientAnimation, forKey: nil)
    }
    
    func autoReverse()->Bool{
        let coll = [0,1]
        let rand = coll[Int(arc4random_uniform(UInt32(coll.count)))]
        return rand == 0
    }
    
    public override func layoutSubviews() {
         gradientLayer.frame = CGRect(x: -bounds.width, y: bounds.origin.y, width: 3 * bounds.width, height: bounds.height * 2)
        clipsToBounds = true
    }
    
    public override func removeFromSuperview() {
        //gradientLayer.removeAllAnimations()
        
    }
}

extension CGColor{
    
    public static var whiteGray:CGColor{
        return UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 0.7).cgColor
        
    }
    
    public static var mat_gray2:CGColor{
         return UIColor(red:0.86, green:0.86, blue:0.86, alpha:1.0).cgColor
    }
    
    public static var mat_gray:CGColor{
        return UIColor(red:0.79, green:0.79, blue:0.79, alpha:1.0).cgColor
    }
}

