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
        view.backgroundColor = .yellow
//        array = [arb,zp]
//        print("The first iterations are: \(array.debugDescription)")
//
//        arb.itemcount = 1000
//        print("The second iterations are: \(array.debugDescription)")
//
//        array.forEach { (item) in
           // print("This is the count: \(item.itemName) and \(item.itemcount)")
       // }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let progress = FullScaffoldView(frame: view.frame)
//        progress.showProgress(with: 20)
//        view.addSubview(progress)
//
//        let loader = ActivityLoaderView(frame: view.frame, offset: 0, text: "Heyaaa")
//        view.addSubview(loader)
//        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 50)))
//        button.backgroundColor = UIColor.brown
//        button.setTitleColor(.white, for: .normal)
//        button.setTitle("Press Me", for: .normal)
//        button.addTarget(self, action: #selector(pressMe), for: .touchUpInside)
//        view.addSubview(button)
//        button.center = view.center
//
        //let options = [("Pay 10$",{print("I Paid holy <Molly")},UIImage(named: "ic")),("Pay 1000$",{print("I Paid holy <Moses")},UIImage(named: "ic"))]
 //       alert = TWAlertView(options: options)
//        var flip = FlippingCards()
//        view.addSubview(flip)
        //SnackBar.makeSnackIn(view, text: "Hey There Boys Im snacky")
        let v = PKAlertView(frame:view.frame)
        view.addSubview(v)
        
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



