//
//  AuthManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension ViewController{
    func manageAuth(){
        self.handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                let loginPage = LoginViewController()
                self.navigationController?.pushViewController(loginPage, animated: false)

            }else{
                //MARK: the user is signed in...
            }
        }
    }
}
