//
//  ViewController.swift
//  SimpleAutoLayoutExample02
//
//  Created by HanGyo Jeong on 2020/06/02.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let superview = self.view
        
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "My Label"
        
        let myButton = UIButton()
        myButton.setTitle("My Button", for: .normal)
        myButton.backgroundColor = .blue
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addSubview(myLabel)
        superview?.addSubview(myButton)
        
        var myConstraint = NSLayoutConstraint(item: myLabel,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: superview,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 0)
        superview?.addConstraint(myConstraint)
        
        myConstraint = NSLayoutConstraint(item: myLabel,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: superview,
                                          attribute: .centerX,
                                          multiplier: 1.0,
                                          constant: 0)
        superview?.addConstraint(myConstraint)
        
        myConstraint = NSLayoutConstraint(item: myButton,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: myLabel,
                                          attribute: .leading,
                                          multiplier: 1.0,
                                          constant: -10)
        superview?.addConstraint(myConstraint)
        
        myConstraint = NSLayoutConstraint(item: myButton,
                                          attribute: .lastBaseline,
                                          relatedBy: .equal,
                                          toItem: myLabel,
                                          attribute: .lastBaseline,
                                          multiplier: 1.0,
                                          constant: 0)
        superview?.addConstraint(myConstraint)
    }
}

