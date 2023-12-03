//
//  ViewController.swift
//  MementoPattern
//
//  Created by 오킹 on 2023/12/02.
//

import UIKit

class ViewController: UIViewController {

    let myButton: MyButton = {
        let button = MyButton(type: .border)
        return button
    }()
    
//    let mainButton: MainButton = {
//        let button = MainButton (type: .fill)
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        let a = MainButton(type: .border)
        
  //      view.addSubview(mainButton)
//
//        myButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(self.mainButton)
//        
//        NSLayoutConstraint.activate([
//            self.mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            self.mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
//            self.mainButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
//            self.mainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50)
//        ])
    }
}

