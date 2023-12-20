//
//  AddFriendViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/12/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class AddFriendViewController: UIViewController {
    
    var currentUser: User?
    
    let db = Firestore.firestore()
    let addFriendPage = AddFriendView()
        
    override func loadView() {
        view = addFriendPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add New Friend"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onSubmitTapped))
    }
    
    
    @objc func onSubmitTapped() {
        // Add a new document in collection "cities"
        
        // Check data are correct
        if let titleContent = addFriendPage.titleBlock.text,
           titleContent != "", titleContent != currentUser!.email {
            
            db.collection("userData")
                .document(currentUser!.email.lowercased())
                .collection("Friend")
                .addDocument(data: [
                    "email": titleContent,
                    "time": 0
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        self.navigationController?.popViewController(animated: true)
                        print("Document successfully written!")
                    }
                }
        } else {
            let alert = UIAlertController(
                    title: "Error!", message: "Email cannot be empty or your own email",
                    preferredStyle: .alert
                )
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true)
        }
        
    }
    

}
