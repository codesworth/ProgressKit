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
//        backgroundColor = UIColor.gray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
     Shows the progress or loader view.
     @param: segments -> Number of segments you want. This is useful to simulate table views. Currently a max segmnet of 10
     */
    public func showProgress(with segments:CGFloat){
        
        self.segments = segments < 11 ? segments : 10
        addDividers()
        syntesizeBases()
    }
    
    func makeSizeFrom(_ segments:CGFloat)->CGSize{
        let width = frame.width * 0.9
        let height = (frame.height / segments) * 0.8
        return CGSize(width: width, height: height)
    }
    
    private func syntesizeBases(){
        let baseSize = makeSizeFrom(segments)
        for segment in 0..<Int(segments){
            let originX = frame.width * 0.05
            let originY = calculateOrginY(CGFloat(segment))
            let base = ScaffoldBase(frame: CGRect(origin: CGPoint(x: originX, y: originY), size: baseSize))
            addSubview(base)
            
        }
    }
    
    func addDividers(){
        if segments > 1{
            for seg in 0..<Int(segments){
               let divY = (frame.height / segments) * CGFloat(seg)
                let line = UIView(frame: CGRect(x: 0, y: divY, width: frame.width, height: 1))
                line.backgroundColor = .lightGray
                addSubview(line)
            }
        }
    }
    
    func calculateOrginY(_ position:CGFloat)->CGFloat{
        let divHeight = frame.height / segments
        let upperSpace = (divHeight - (divHeight * 0.7)) / 2
        let offset = upperSpace + (divHeight * position - 1)
        return offset
    }
}
