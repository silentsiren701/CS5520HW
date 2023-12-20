//
//  LoginViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    let loginPage = LoginView()
    
    override func loadView() {
        view = loginPage
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginPage.registerButton.addTarget(self, action: #selector(onButtonRegisterTapped), for: .touchUpInside)
        loginPage.loginButton.addTarget(self, action: #selector(onLoginButtonTapped), for: .touchUpInside)
        
        navigationItem.hidesBackButton = true 
    }
    
    // MARK: - Button functions
    @objc func onButtonRegisterTapped() {
        let registerScreen = RegisterViewController()
        navigationController?.pushViewController(registerScreen, animated: true)
    }
    
    @objc func onLoginButtonTapped() {
        /**
         This function will try to login the page, it will push main Screen out if success
         */
        if let email = self.loginPage.emailFeild.text,
           let password = self.loginPage.pwFeild.text {
            signInToFirebase(email: email, password: password)
        }
    }
    
    
    // MARK: - Email and Password Authentication
    func signInToFirebase(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                // user authenticated...
                //self.navigationController?.popViewController(animated: true)
                self.navigationController?.popToRootViewController(animated: true)
            }else{
                let signInAlert = UIAlertController(
                    title: "Sign In Failed",
                    message: "Please check email or password",
                    preferredStyle: .alert)
                
                
                signInAlert.addAction(UIAlertAction(title: "OK", style: .cancel))
                
                self.present(signInAlert, animated: true)
            }
        })
    }
}
