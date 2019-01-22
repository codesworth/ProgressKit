//
//  FullScaffoldView.swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 22/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import UIKit

public class FullScaffoldView:UIView{
    
    private var segments:CGFloat = 1
    
    private var bases:[ScaffoldBase] = []
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func showProgress(with segments:CGFloat){
       self.segments = segments
        syntesizeBases()
    }
    
    func makeSizeFrom(_ segments:CGFloat)->CGSize{
        let width = frame.width * 0.8
        let height = (frame.height / segments) * 0.7
        return CGSize(width: width, height: height)
    }
    
    private func syntesizeBases(){
        let baseSize = makeSizeFrom(segments)
        for segment in 0..<Int(segments){
            let originX = frame.width * 0.1
            let originY = calculateOrginY(CGFloat(segment))
            let base = ScaffoldBase(frame: CGRect(origin: CGPoint(x: originX, y: originY), size: baseSize))
            addSubview(base)
        }
    }
    
    
    func calculateOrginY(_ position:CGFloat)->CGFloat{
        let divHeight = frame.height / segments
        let upperSpace = (divHeight - (divHeight * 0.7)) / 2
        let offset = upperSpace + (divHeight * position - 1)
        return offset
    }
}
