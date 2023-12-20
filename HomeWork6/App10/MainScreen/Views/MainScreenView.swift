//
//  MainScreenView.swift
//  App10
//
//  Created by Sakib Miazi on 5/25/23.
//

import UIKit

class MainScreenView: UIView {
    //MARK: tableView for contacts...
    var contentWrapper:UIScrollView!
    var tableViewContacts: UITableView!
    
    //MARK: bottom view for adding a Contact...
    var bottomAddView:UIView!
    var textFieldAddName:UITextField!
    var textFieldAddEmail:UITextField!
    var textFieldAddPhone:UITextField!
    var buttonAdd:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupTableViewContacts()
        
        setupBottomAddView()
        setupTextFieldAddName()
        setupTextFieldAddEmail()
        setupTextFieldAddPhone()
        setupButtonAdd()
        
        initConstraints()
    }
    
    //MARK: makes the table view be scrollable
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    //MARK: the table view to show the list of contacts...
    func setupTableViewContacts(){
        tableViewContacts = UITableView()
        tableViewContacts.register(ContactsTableViewCell.self, forCellReuseIdentifier: "names")
        tableViewContacts.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(tableViewContacts)
    }
    
    //MARK: the bottom add contact view....
    func setupBottomAddView(){
        bottomAddView = UIView()
        bottomAddView.backgroundColor = .white
        bottomAddView.layer.cornerRadius = 6
        bottomAddView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomAddView.layer.shadowOffset = .zero
        bottomAddView.layer.shadowRadius = 4.0
        bottomAddView.layer.shadowOpacity = 0.7
        bottomAddView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomAddView)
    }
    
    func setupTextFieldAddName(){
        textFieldAddName = UITextField()
        textFieldAddName.placeholder = "Name"
        textFieldAddName.borderStyle = .roundedRect
        textFieldAddName.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(textFieldAddName)
    }
    
    func setupTextFieldAddEmail(){
        textFieldAddEmail = UITextField()
        textFieldAddEmail.placeholder = "Email"
        textFieldAddEmail.borderStyle = .roundedRect
        textFieldAddEmail.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(textFieldAddEmail)
    }
    
    func setupTextFieldAddPhone(){
        textFieldAddPhone = UITextField()
        textFieldAddPhone.placeholder = "Phone"
        textFieldAddPhone.borderStyle = .roundedRect
        textFieldAddPhone.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(textFieldAddPhone)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonAdd.setTitle("Add Contact", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(buttonAdd)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            //bottom add view...
            bottomAddView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            bottomAddView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bottomAddView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            buttonAdd.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
            buttonAdd.leadingAnchor.constraint(equalTo: bottomAddView.leadingAnchor, constant: 4),
            buttonAdd.trailingAnchor.constraint(equalTo: bottomAddView.trailingAnchor, constant: -4),
            
            textFieldAddPhone.bottomAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -8),
            textFieldAddPhone.leadingAnchor.constraint(equalTo: buttonAdd.leadingAnchor, constant: 4),
            textFieldAddPhone.trailingAnchor.constraint(equalTo: buttonAdd.trailingAnchor, constant: -4),
            
            textFieldAddEmail.bottomAnchor.constraint(equalTo: textFieldAddPhone.topAnchor, constant: -8),
            textFieldAddEmail.leadingAnchor.constraint(equalTo: textFieldAddPhone.leadingAnchor),
            textFieldAddEmail.trailingAnchor.constraint(equalTo: textFieldAddPhone.trailingAnchor),
            
            textFieldAddName.bottomAnchor.constraint(equalTo: textFieldAddEmail.topAnchor, constant: -8),
            textFieldAddName.leadingAnchor.constraint(equalTo: textFieldAddEmail.leadingAnchor),
            textFieldAddName.trailingAnchor.constraint(equalTo: textFieldAddEmail.trailingAnchor),
            
            bottomAddView.topAnchor.constraint(equalTo: textFieldAddName.topAnchor, constant: -8),
            
            //...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: bottomAddView.topAnchor),
            
            tableViewContacts.topAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableViewContacts.leadingAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewContacts.trailingAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewContacts.bottomAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}