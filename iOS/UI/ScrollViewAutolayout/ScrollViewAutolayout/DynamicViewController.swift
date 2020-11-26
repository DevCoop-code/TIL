//
//  DynamicViewController.swift
//  ScrollViewAutolayout
//
//  Created by HanGyo Jeong on 2020/11/26.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import UIKit

class DynamicViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(adjustButtonDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc func adjustButtonDynamicType() {
        buttons.forEach { (button) in
            button.titleLabel?.adjustsFontForContentSizeCategory = true
        }
    }
    
    @IBAction func addView(_ sender: Any) {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isHidden = true
        label.text = """
                ha;ofjasdlkfj
                a;fioaejfksda
                a;sfijealkjd
        """
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        stackView.addArrangedSubview(label)
        
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }
    
    
    @IBAction func removeView(_ sender: Any) {
        guard let last = stackView.arrangedSubviews.last else { return }
        
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
            self.stackView.removeArrangedSubview(last)
        }
    }
}
