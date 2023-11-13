//
//  ViewController.swift
//  noStoryBoard
//
//  Created by 김명현 on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        let helloLabel: UILabel = .init()
        helloLabel.text = "Hello"
        
        view.addSubview(helloLabel)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let worldLabel: UILabel = .init()
        worldLabel.text = "World"
        
        view.addSubview(worldLabel)
        worldLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let textField: UITextField = .init()
        textField.placeholder = "내용을 입력하세요"
        textField.borderStyle = .roundedRect
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let Constraints = [
            helloLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            worldLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            worldLabel.leadingAnchor.constraint(equalTo: helloLabel.trailingAnchor, constant: 20),
            textField.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ]
        
        NSLayoutConstraint.activate(Constraints)

    }

}


