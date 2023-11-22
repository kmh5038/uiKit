//
//  AddViewController.swift
//  TodoListUikit
//
//  Created by 김명현 on 11/20/23.
//

import UIKit

final class AddViewController: UIViewController {
    
    var viewModel: TodoData?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
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
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        if titleTextField.text?.isEmpty == true || scheduleTextView.text.isEmpty == true {
            addButton.isUserInteractionEnabled = false
        } else {
            addButton.isUserInteractionEnabled = true
        }
        
        return addButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setConstraint()
        addKeyboardNotifications()
        self.hideKeyborad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height) // 스크롤뷰 서브뷰 범위
        
    }
    
    
    
    
    func setData(input: TodoData) {
        viewModel = input
    }
    
    func setConstraint() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scheduleLabel)
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scheduleTextView)
        scheduleTextView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            header.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            header.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            scheduleLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            scheduleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scheduleTextView.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor, constant: 10),
            scheduleTextView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scheduleTextView.widthAnchor.constraint(equalToConstant: 350),
            scheduleTextView.heightAnchor.constraint(equalToConstant: 400),
            addButton.topAnchor.constraint(equalTo: scheduleTextView.bottomAnchor, constant: 50),
            addButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    
    
    
    @objc func addButtonTapped() {
        
        guard let title = titleTextField.text, !title.isEmpty else { return }
        guard let schedule = scheduleTextView.text, !schedule.isEmpty else { return }
        
        
        viewModel?.dataList.append(Todo(id: (viewModel?.dataList.count ?? 0) + 1, title: title, description: schedule, completed: false))
        
        
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func completionBtn(isOn: Bool) {
        switch isOn {
        case true:
            addButton.isEnabled = true
            addButton.setTitleColor(.systemBlue, for: .normal)
        case false:
            addButton.isEnabled = false
            addButton.setTitleColor(.gray, for: .normal)
        }
    }
    
   
    
    func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc func keyboardWillShow(noti: Notification) {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 140, right: 0)
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        scrollView.contentInset = .zero // 키보드가 내려가고 나면 가장자리 확장 0으로 변경
    }
    
  
    
}



extension UIViewController {
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // 키보드 닫는 메서드 1
    //           view.endEditing(true)
    //       }
    
    func hideKeyborad() { // 키보드 닫는 메서드 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap) // 제스처 인식 추가
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
