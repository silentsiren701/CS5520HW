//
//  RegisterPageView.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/2/23.
//

import UIKit

class RegisterPageView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var loginLabel: UILabel!;
    
    var emailFeild: UITextField!;
    var pwFeild: UITextField!;
    var nameFeild: UITextField!;
    
    var loginButton: UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
            
        setloginLabel()
        
        setemailFeild()
        setpwFeild()
        setnameFeild()
        
        setloginButton()
        
        initConstraints()
    }
    
    func setloginLabel() {
        loginLabel = UILabel()
        loginLabel.text = "Login your account"
        loginLabel.font = .boldSystemFont(ofSize: 24)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginLabel)
    }
    
    func setemailFeild() {
        emailFeild = UITextField()
        emailFeild.font = UIFont.systemFont(ofSize: 20);
        emailFeild.placeholder = "Email"
        emailFeild.borderStyle = .roundedRect
        emailFeild.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailFeild)
    }
    
    func setpwFeild() {
        pwFeild = UITextField()
        pwFeild.font = UIFont.systemFont(ofSize: 20);
        pwFeild.placeholder = "Password"
        pwFeild.borderStyle = .roundedRect
        pwFeild.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pwFeild)
    }
    
    func setnameFeild() {
        nameFeild = UITextField()
        nameFeild.font = UIFont.systemFont(ofSize: 20);
        nameFeild.placeholder = "Name"
        nameFeild.borderStyle = .roundedRect
        nameFeild.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameFeild)
    }
     
    
    func setloginButton() {
        loginButton = UIButton(type: .system)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        loginButton.setTitle("Register", for: .normal)
        loginButton.configuration = .filled()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginButton)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            //bottom add view...
            
            loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            loginLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            emailFeild.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 24),
            emailFeild.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            emailFeild.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            pwFeild.topAnchor.constraint(equalTo: emailFeild.bottomAnchor, constant: 24),
            pwFeild.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            pwFeild.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            nameFeild.topAnchor.constraint(equalTo: pwFeild.bottomAnchor, constant: 24),
            nameFeild.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            nameFeild.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            loginButton.topAnchor.constraint(equalTo: nameFeild.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 14),
            loginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
        ])
    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
