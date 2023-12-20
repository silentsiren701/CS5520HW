//
//  FriendView.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import UIKit

class FriendView: UIView {

    var labelText: UILabel!
    var warningText: UILabel!
    var tableViewFriends: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupLabelText()
        setupWarningText()
        setupTableViewFriends()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupWarningText(){
        warningText = UILabel()
        warningText.text = "You can gift each friend a point once per day."
        warningText.font = .boldSystemFont(ofSize: 14)
        warningText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(warningText)
    }
    
    func setupTableViewFriends(){
        tableViewFriends = UITableView()
        tableViewFriends.register(FriendTableViewCell.self, forCellReuseIdentifier: "FriendReuseIdentifier")
        
        tableViewFriends.layer.borderWidth = 0.5
        tableViewFriends.layer.cornerRadius = 5
        
        tableViewFriends.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewFriends)
    }
    
    
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            labelText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            warningText.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 8),
            warningText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            tableViewFriends.topAnchor.constraint(equalTo: warningText.bottomAnchor, constant: 8),
            tableViewFriends.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewFriends.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewFriends.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
