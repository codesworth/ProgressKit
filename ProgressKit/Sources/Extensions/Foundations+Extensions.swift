//
//  Foundations+Extensions.swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 22/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import Foundation


extension NSObject{
    
    public static var identifier:String{
        return String(describing: self)
    }
}
