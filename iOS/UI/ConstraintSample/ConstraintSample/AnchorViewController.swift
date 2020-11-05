//
//  AnchorViewController.swift
//  ConstraintSample
//
//  Created by HanGyo Jeong on 2020/11/02.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        
        let safeButtonAnchor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        
        safeButtonAnchor.isActive = true
//        safeButtonAnchor.priority = .defaultHigh
        safeButtonAnchor.priority = .init(999)
        
        let viewButtonAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        viewButtonAnchor.isActive = true
        
    }
}
