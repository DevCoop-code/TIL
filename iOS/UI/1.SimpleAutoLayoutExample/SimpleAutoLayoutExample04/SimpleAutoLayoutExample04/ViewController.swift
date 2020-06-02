//
//  ViewController.swift
//  SimpleAutoLayoutExample04
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
        myButton.backgroundColor = .red
        myButton.setTitle("My Button", for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addSubview(myLabel)
        superview?.addSubview(myButton)
        
        let viewDictionary = ["myLabel": myLabel, "myButton":myButton]
        
        //수직 Constraint 생성 및 추가
        superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[myButton]-|",
                                                                options: .alignAllFirstBaseline,
                                                                metrics: nil,
                                                                views: viewDictionary))
        //수평 Constraint 생성 및 추가
        superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-[myButton]-[myLabel(==myButton)]-|",
                                                                 options: .alignAllFirstBaseline,
                                                                 metrics: nil,
                                                                 views: viewDictionary))
    }
}

