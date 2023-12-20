//
//  ProfileView.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/5/23.
//

import UIKit

class ProfileView: UIView {
    
    var nameLabel: UILabel!
    var nameContentLabel: UILabel!
    var emailLabel: UILabel!
    var emailContentLabel: UILabel!
    var idLabel: UILabel!
    var idContentLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setNamelabel()
        setNameContentLabel()
        setEmailLabel()
        setEmailContentLabel()
        setIdLabel()
        setIdContentLabel()
        
        initConstraints()
    }
    
    func setNamelabel() {
        nameLabel = UILabel()
        nameLabel.text = "Name: "
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
    }
    
    func setNameContentLabel() {
        nameContentLabel = UILabel()
        nameContentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameContentLabel)
    }
    
    func setEmailLabel() {
        emailLabel = UILabel()
        emailLabel.text = "Email: "
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailLabel)
    }
    
    func setEmailContentLabel() {
        emailContentLabel = UILabel()
        emailContentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailContentLabel)
    }
    
    func setIdLabel() {
        idLabel = UILabel()
        idLabel.text = "ID: "
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(idLabel)
    }
    
    func setIdContentLabel() {
        idContentLabel = UILabel()
        idContentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(idContentLabel)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            nameContentLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            nameContentLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            emailLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            emailContentLabel.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 8),
            emailContentLabel.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            
            idLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 16),
            idLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            idContentLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 8),
            idContentLabel.centerYAnchor.constraint(equalTo: idLabel.centerYAnchor),
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
