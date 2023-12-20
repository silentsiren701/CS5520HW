//
//  RegisterViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {

    var currentUser:FirebaseAuth.User?
    let db = Firestore.firestore()
    let RegisterScreen = RegisterView()
    
    override func loadView() {
        view = RegisterScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        RegisterScreen.signUpButton.addTarget(self, action: #selector(onSignUpTapped), for: .touchUpInside)
    }
    
    
    // MARK: - button functions
    @objc func onSignUpTapped() {
        if let email = RegisterScreen.emailFeild.text,
           let pw = RegisterScreen.pwFeild.text,
           let name = RegisterScreen.nameFeild.text {
            Auth.auth().createUser(withEmail: email, password: pw) { authResult, error in
                if let error = error {
                    // we have an error
                    print("User Create Error")
                    print(error.localizedDescription)
                } else {
                    // successful create user, we then save data in database
                    self.makePublic(user: User(email: email, name: name))
                    self.backTwo()
                }
            }
        }
    }
    
    func makePublic(user: User) {
        let collectionUsers = db
            .collection("users")
            .document(user.email.lowercased())
            
        do{
            try collectionUsers.setData(from: user)
            
        }catch{
            print("Error adding document!")
        }
    }
    
    func backTwo() {
        // refer: https://stackoverflow.com/questions/26132658/pop-2-view-controllers-in-nav-controller-in-swift
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
}
