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
    
    let overlay = UIView()
    
    override init(frame: CGRect) {
        let nframe = UIScreen.main.bounds
        super.init(frame: nframe)
        self.frame = nframe
        backgroundColor = .clear
        
    }
    
    init(){
        let nframe = UIScreen.main.bounds
        super.init(frame: nframe)
        self.frame = nframe
        backgroundColor = .clear
        
    }
    
    
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        overlay.frame = frame
        overlay.backgroundColor = .black
        overlay.alpha = 0.5
        card.frame.size = CGSize(width: 80, height: 80)
        card.center = center
        addSubview(overlay)
        addSubview(card)
    }
    
    
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        animateForever()
    }
    
    func animateForever(){
        UIView.transition(with: card, duration: 1, options: [card.getRandomColorAndTransition().1], animations: {
            self.card.backgroundColor = self.card.colors.randomElement()!
        }) { (tr) in
            self.animateForever()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
