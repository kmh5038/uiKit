//
//  DetailViewController.swift
//  TodoListUikit
//
//  Created by 김명현 on 11/19/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedTodo: Todo?
    
    var fixLabel: UILabel = {
        var fixLabel = UILabel()
        fixLabel.text = "Schedule"
        fixLabel.font = .preferredFont(forTextStyle: .headline)
        return fixLabel
    }()
    
    var detailLabel: UILabel = {
        var detailLabel = UILabel()
        detailLabel.numberOfLines = 2
        return detailLabel
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setConstraint()
    }
    
    func setConstraint() {
        
        view.addSubview(fixLabel)
        fixLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.text = selectedTodo?.description
        
        
        
        NSLayoutConstraint.activate([
            fixLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            fixLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailLabel.topAnchor.constraint(equalTo: fixLabel.bottomAnchor, constant: 50),
            detailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailLabel.widthAnchor.constraint(equalToConstant: 300),
            detailLabel.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
