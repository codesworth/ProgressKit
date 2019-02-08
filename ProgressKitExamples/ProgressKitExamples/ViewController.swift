//
//  ViewController.swift
//  ProgressKitExamples
//
//  Created by Mensah Shadrach on 22/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import UIKit
import ProgressKit

class ViewController: UIViewController {
    
    let arb = Item(name: "Hanbe", count: 0)
    let zp = Item(name: "Poola", count: 3)
    var array:[Item]!
    var alert:TWAlertView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let imageView = UIImageView(frame: view.frame)
        let image:Image = "img3"
        imageView.image = image.image
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        flipAcard()
    }
    
    
    func snack(){
        SnackBar.makeSnackIn(view, text: "Hey There Boys Im snacky")
    }
    
    func PKAlert(){
        let v = PKAlertView(frame:view.frame)
        view.addSubview(v)
    }
    
    
    func loaderActivity(){
        let loader = ActivityLoaderView(frame: view.frame, offset: 0, text: "Heyaaa")
        view.addSubview(loader)
    }
    
    func scafolding(){
        let progress = FullScaffoldView(frame: view.frame)
        progress.showProgress(with: 20)
        view.addSubview(progress)
    }
    
    func twitterAlert(){
    let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 50)))
    button.backgroundColor = UIColor.brown
    button.setTitleColor(.white, for: .normal)
    button.setTitle("Press Me", for: .normal)
    button.addTarget(self, action: #selector(pressMe), for: .touchUpInside)
    view.addSubview(button)
    button.center = view.center
    let options = [("Pay 10$",{print("I Paid holy <Molly")},UIImage(named: "ic")),("Pay 1000$",{print("I Paid holy <Moses")},UIImage(named: "ic"))]
           alert = TWAlertView(options: options)
    }
    
    func flipAcard(){
        let flip = FlippingCards()
        view.addSubview(flip)
    }
    
    @objc func pressMe(){
        view.addSubview(alert)
        
    }

}


class Item{
    var itemcount:Int
    var itemName:String
    
    init(name:String,count:UInt) {
        itemName = name
        itemcount = Int(count)
    }
}



class Image:ExpressibleByStringLiteral {
    typealias StringLiteralType = String
    
    var image:UIImage?
    
    required init(stringLiteral value: Image.StringLiteralType) {
        image = UIImage(named: value)
    }
}


