
//
//  BaseCard.swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 30/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import UIKit

class BaseCard: UIView {

    override init(frame:CGRect){
        super.init(frame:frame)
        
    }
    
    public var colors:[UIColor]{
        return [
            .slate,
            .cloudyBlue,
            .seafoamBlue,
            .white,
            .pear,
            .deepRose,
            .orangeRed,
            .slate55,
            .charcoal
        ]
    }
    
    var options:[AnimationOptions]{
        return [
            .transitionFlipFromLeft,
            .transitionFlipFromRight,
            .transitionCurlUp,
            .transitionCurlDown,
            .transitionCrossDissolve,
            .transitionFlipFromTop,
            .transitionFlipFromBottom
        ]
    }
    
    func getRandomColorAndTransition()->(UIColor,UIView.AnimationOptions){
        return (colors.randomElement()!,options.randomElement()!)
    }
    
    func AnimateForever(){
        let ops = getRandomColorAndTransition()
        UIView.transition(from: self, to: self, duration: 0.8, options: [ops.1,.showHideTransitionViews]) { (succ) in
            self.backgroundColor = ops.0
            self.AnimateForever()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
