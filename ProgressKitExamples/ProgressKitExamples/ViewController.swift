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

    var alert:TWAlertView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 50)))
        button.backgroundColor = UIColor.brown
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Press Me", for: .normal)
        button.addTarget(self, action: #selector(pressMe), for: .touchUpInside)
        view.addSubview(button)
        button.center = view.center
        
        let options = [("Pay 10$",{print("I Paid holy <Molly")},UIImage(named: "ic")),("Pay 1000$",{print("I Paid holy <Moses")},UIImage(named: "ic")),("Fire Me Please",{print("II was fired")},UIImage(named: "ic")),("Pay 10$",{print("I Paid holy <Molly")},UIImage(named: "ic")),("Pay 1000$",{print("I Paid holy <Moses")},UIImage(named: "ic")),("Fire Me Please",{print("II was fired")},UIImage(named: "ic")),("Pay 10$",{print("I Paid holy <Molly")},UIImage(named: "ic")),("Pay 1000$",{print("I Paid holy <Moses")},UIImage(named: "ic")),("Fire Me Please",{print("II was fired")},UIImage(named: "ic")),("Pay 10$",{print("I Paid holy <Molly")},UIImage(named: "ic")),("Pay 1000$",{print("I Paid holy <Moses")},UIImage(named: "ic")),("Fire Me Please",{print("II was fired")},UIImage(named: "ic")),("Pay 10$",{print("I Paid holy <Molly")},UIImage(named: "ic")),("Pay 1000$",{print("I Paid holy <Moses")},UIImage(named: "ic")),("Fire Me Please",{print("II was fired")},UIImage(named: "ic")),("Pay 10$",{print("I Paid holy <Molly")},UIImage(named: "ic")),("Pay 1000$",{print("I Paid holy <Moses")},UIImage(named: "ic")),("Fire Me Please",{print("II was fired")},UIImage(named: "ic"))]
        alert = TWAlertView(options: options)
        
        
    }
    
    @objc func pressMe(){
        view.addSubview(alert)
        
    }

}

