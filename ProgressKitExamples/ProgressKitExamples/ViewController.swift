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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let progress = FullScaffoldView(frame: view.frame)
        progress.showProgress(with: 4)
        view.addSubview(progress)
        
    }

}

