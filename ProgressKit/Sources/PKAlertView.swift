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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
