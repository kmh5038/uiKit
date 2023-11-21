//
//  DetailViewController.swift
//  TodoListUikit
//
//  Created by 김명현 on 11/19/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedTodo: Todo?
    
    var label: UILabel = {
        var label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setConstraint()
        
       
    }
    
    func setConstraint() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = selectedTodo?.description
        
        
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
   

}
