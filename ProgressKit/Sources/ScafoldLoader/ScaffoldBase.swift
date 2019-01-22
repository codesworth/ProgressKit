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
        let colors:[CGColor] = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
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
        layer.addSublayer(gradientLayer)
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.00,0.00,0.25]
        gradientAnimation.toValue = [0.75,1.0,1.0]
        gradientAnimation.duration = 3.0
        gradientAnimation.repeatCount = .infinity
        gradientLayer.add(gradientAnimation, forKey: nil)
    }
    
    public override func removeFromSuperview() {
        gradientLayer.removeAllAnimations()
    }
}



