//
//  FlippingCards.swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 31/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import UIKit

public class FlippingCards: UIView {
    let card:BaseCard = {
        let v = BaseCard(frame:.zero)
        v.backgroundColor = .white
        return v
    }()
    
    override init(frame: CGRect) {
        let nframe = UIScreen.main.bounds
        super.init(frame: nframe)
        self.frame = nframe
        backgroundColor = .darkGray
        alpha = 0.5
    }
    
    init(){
        let nframe = UIScreen.main.bounds
        super.init(frame: nframe)
        self.frame = nframe
        backgroundColor = .darkGray
        alpha = 0.5
    }
    
    
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        card.frame.size = CGSize(width: 80, height: 80)
        card.center = center
        addSubview(card)
    }
    
    
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        card.AnimateForever()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
