//
//  StackViewController.swift
//  ConstraintSample
//
//  Created by HanGyo Jeong on 2020/11/05.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    let vertical = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vertical.axis = .vertical
        vertical.translatesAutoresizingMaskIntoConstraints = false
        vertical.spacing = 10
        vertical.distribution = .fillEqually
        view.addSubview(vertical)
        
        let horizontal = UIStackView()
        horizontal.axis = .horizontal
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontal)
        
        let addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.addTarget(self, action: #selector(addView), for: .touchUpInside)
        
        let removeButton = UIButton()
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(.red, for: .normal)
        removeButton.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        
        horizontal.addArrangedSubview(addButton)
        horizontal.addArrangedSubview(removeButton)
        horizontal.distribution = .fillEqually
        
        horizontal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        horizontal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        horizontal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        vertical.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vertical.bottomAnchor.constraint(equalTo: horizontal.bottomAnchor).isActive = true
        vertical.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        vertical.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    @objc func addView() {
        let view = UIView()
        view.backgroundColor = .black
        view.isHidden = true
        vertical.addArrangedSubview(view)
        
        UIView.animate(withDuration: 0.3, animations: {
            view.isHidden = false
        })
    }
    
    @objc func removeView() {
        guard let last = vertical.arrangedSubviews.last else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            last.isHidden = true
        }) { (_) in
            self.vertical.removeArrangedSubview(last)
        }
    }
}
