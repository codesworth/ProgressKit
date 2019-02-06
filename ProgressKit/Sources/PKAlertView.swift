//
//  PKAlertView.swift
//  ProgressKit
//
//  Created by Shadrach Mensah on 05/02/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import Foundation


public class PKAlertView:UIView{
    
    let nativeFrame = UIScreen.main.bounds
    
    private var overlay:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.alpha = 0.6
        return view
    }()
    
    private var alertView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.seafoamBlue
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        overlay.frame = nativeFrame
        alertView.frame.size = CGSize(width: nativeFrame.width * 0.7, height: 200)
        alertView.center = center
        alertView.transform.scaledBy(x: 0.1, y: 0.1)
        addSubview(overlay)
        addSubview(alertView)
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
            self.alertView.transform.scaledBy(x: 1, y: 1)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
