//
//  ViewController.swift
//  TodoListUikit
//
//  Created by 김명현 on 11/19/23.
//


// AddViewController에 add버튼 클릭 시 textField, textView에 쓰여진 text들을 dataList배열에 저장하고 viewController로 돌아간다

import UIKit

class ViewController: UIViewController {
    
    var data = TodoData.shared.dataList {
        didSet {
            tableView.reloadData()
        }
    }
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .white
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell") // tableView에 cell등록
        
        setConstraint()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        print(data)
    }
    
    private func setConstraint() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func editTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        if tableView.isEditing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editTapped))
        }
        else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        }
    }
    
    
    @objc func addTapped() {
        navigationController?.pushViewController(AddViewController(), animated: true)
    }
}



extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    // 특정 인덱스 Row의 Cell에 대한 정보를 넣어 Cell을 반환하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
        
        let todoItem = data[indexPath.row]
        
        cell.setData(input: todoItem)
        
        
        return cell
    }
    
  
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade) // tableView 셀 삭제
            data.remove(at: indexPath.row) // 실제 dataList 삭제
            tableView.endUpdates()
        }
    }
    
    // edit모드 순서변경
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        data.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = data[indexPath.row]
        
        let detailViewController = DetailViewController()
        
        detailViewController.selectedTodo = selectedTodo
        
        navigationController?.pushViewController(detailViewController, animated: true)
        // 뷰 이동 안됨 -> SceneDelegate에 rootView를 navigationView로 바꿔준다
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // cell의 높이 조절
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 헤더의 뷰가 됨
        let headerView = UIView()
        
        // 섹션 헤더의 레이블 생성
        let label: UILabel = {
            let label = UILabel()
            label.text = "Todo-List"
            label.font = UIFont.boldSystemFont(ofSize: 30) // 폰트 설정
            return label
        }()
        
        
        headerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: headerView.topAnchor),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // 섹션 헤더의 높이 설정
    }
    
    
}


