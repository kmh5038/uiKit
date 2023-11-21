//
//  AddViewController.swift
//  TodoListUikit
//
//  Created by 김명현 on 11/20/23.
//

import UIKit

class AddViewController: UIViewController {
    
    var data = TodoData.shared.dataList
    
    let header: UILabel = {
        let header = UILabel()
        header.text = "Add Schedule"
        header.font = .preferredFont(forTextStyle: .headline)
        header.font = .systemFont(ofSize: 30)
        return header
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.font = .preferredFont(forTextStyle: .title3)
        return titleLabel
    }()
    
    var titleTextField: UITextField = {
        var titleTextField = UITextField()
        titleTextField.layer.borderWidth = 0.5
        titleTextField.layer.cornerRadius = 4
        return titleTextField
    }()
    
    let scheduleLabel: UILabel = {
        let scheduleLabel = UILabel()
        scheduleLabel.text = "Schedule"
        scheduleLabel.font = .preferredFont(forTextStyle: .title3)
        return scheduleLabel
    }()
    
    var scheduleTextView: UITextView = {
        var scheduleTextView = UITextView()
        scheduleTextView.layer.borderWidth = 0.5
        scheduleTextView.layer.cornerRadius = 12
        return scheduleTextView
    }()
    
    lazy var addButton: UIButton = {
        var addButton = UIButton()
        addButton.setTitle("ADD", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.backgroundColor = .lightGray
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return addButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setConstraint()
    }
    
    func setConstraint() {
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scheduleLabel)
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scheduleTextView)
        scheduleTextView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
       
    
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scheduleLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            scheduleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scheduleTextView.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor, constant: 10),
            scheduleTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scheduleTextView.widthAnchor.constraint(equalToConstant: 350),
            scheduleTextView.heightAnchor.constraint(equalToConstant: 400),
            addButton.topAnchor.constraint(equalTo: scheduleTextView.bottomAnchor, constant: 30),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

    
    @objc func addButtonTapped() {
        
        guard let title = titleLabel.text, !title.isEmpty else { return }
        guard let schedule = scheduleTextView.text, !schedule.isEmpty else { return }

                
        data.append(Todo(id: data.count + 1, title: title, description: schedule, completed: false))
        
        
        navigationController?.popViewController(animated: true)
        
    }
}

