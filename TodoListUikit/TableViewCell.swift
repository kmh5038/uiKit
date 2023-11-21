//
//  TableViewCell.swift
//  TodoListUikit
//
//  Created by 김명현 on 11/19/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var todoData: Todo?
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        //        button.setImage(UIImage(systemName: todoData!.completed ? "checkmark.circle.fill" : "checkmark.circle"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        label.text = ""
    }
    
    func setData(input: Todo) {
        todoData = input
        self.label.text = input.title
        button.setImage(UIImage(systemName: input.completed ? "checkmark.circle.fill" : "checkmark.circle"), for: .normal)
    }
    
    func setConstraint() {
        contentView.addSubview(label)
        contentView.addSubview(button)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // contextView가 tableViewCell을 의미함 (여기서 cell에 버튼과 레이블이 들어감)
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 65),
            button.heightAnchor.constraint(equalToConstant: 65),
            label.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
    }
    
    
    
    @objc func buttonTapped() {
        
        todoData?.completed.toggle()
        button.setImage(UIImage(systemName: todoData?.completed ?? false ? "checkmark.circle.fill" : "checkmark.circle"), for: .normal)
        print(todoData?.completed)
        
    }
}
