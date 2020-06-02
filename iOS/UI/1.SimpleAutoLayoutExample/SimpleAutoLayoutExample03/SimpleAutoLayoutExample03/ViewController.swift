//
//  ViewController.swift
//  SimpleAutoLayoutExample03
//
//  Created by HanGyo Jeong on 2020/06/02.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var viewV: UIView!
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewV.removeConstraint(centerConstraint)
        
        let constraint = NSLayoutConstraint(item: myLabel,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: myButton,
                                            attribute: .centerX,
                                            multiplier: 1.0,
                                            constant: 0.0)
        self.view.addConstraint(constraint)
    }
}

