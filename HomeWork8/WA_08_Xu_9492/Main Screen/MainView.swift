//
//  MainView.swift
//  WA_08_Xu_9492
//
//  Created by Aiden Hsu on 11/14/23.
//

import UIKit

class MainView: UIView {
    
    var contentWrapper:UIScrollView!
    var ChatTableView: UITableView!
    var logoutButton: UIButton!;
    var profileButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupTableViewNote()
        
        setlogoutButton()
        setProfileButton()
        
        initConstraints()
    }
    
    //MARK: makes the table view be scrollable
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    //MARK: the table view to show the list of contacts...
    func setupTableViewNote(){
        ChatTableView = UITableView()
        ChatTableView.register(MainChatTableViewCell.self, forCellReuseIdentifier: "ChatCell")
        ChatTableView.separatorStyle = .singleLine
        ChatTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(ChatTableView)
    }
    
    func setlogoutButton() {
        logoutButton = UIButton(type: .system)
        logoutButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.configuration = .filled()
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoutButton)
    }

    func setProfileButton() {
        profileButton = UIButton(type: .system)
        profileButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        profileButton.setTitle("Profile", for: .normal)
        profileButton.configuration = .gray()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            //...
//                contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//                contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//                contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
//                contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
//
//                NotesTableView.topAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.topAnchor, constant: 32),
//                NotesTableView.leadingAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.leadingAnchor, constant: 8),
//                NotesTableView.trailingAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            logoutButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            logoutButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 16),
            
            profileButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            profileButton.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -16),
            
            ChatTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            ChatTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            ChatTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            ChatTableView.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -8),
        ])
    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
