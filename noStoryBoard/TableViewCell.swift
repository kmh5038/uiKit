//
//  TableViewCell.swift
//  noStoryBoard
//
//  Created by 김명현 on 11/14/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 
    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        return button
    }()
    
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "강아지"
        return label
    }()
    
    
    private func setConstraint() {
        contentView.addSubview(button)
        contentView.addSubview(label)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
