//
//  ViewController.swift
//  SimpleAutoLayoutExample05
//
//  Created by HanGyo Jeong on 2020/06/03.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cupStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addCup(_ sender: Any) {
        let cupImage = UIImageView(image: UIImage(named: "hotAmericano"))
        cupImage.contentMode = .scaleAspectFit
        
        UIView.animate(withDuration: 0.75,
                       animations: {
                            self.cupStackView.addArrangedSubview(cupImage)
                            self.cupStackView.layoutIfNeeded()
        })
    }
    
    @IBAction func removeCup(_ sender: Any) {
        let lastAddedCup = self.cupStackView.arrangedSubviews.last
        
        if let cup = lastAddedCup
        {
            UIView.animate(withDuration: 0.25,
                           animations: {
                            self.cupStackView.removeArrangedSubview(cup)
                            cup.removeFromSuperview()
                            self.cupStackView.layoutIfNeeded()
            })
        }
    }
}

