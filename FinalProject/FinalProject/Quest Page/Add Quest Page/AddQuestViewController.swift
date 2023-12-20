//
//  AddQuestViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/6/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class AddQuestViewController: UIViewController {
    
    var currentUser: User?
    
    let db = Firestore.firestore()
    let addQuestPage = AddQuestView()
        
    override func loadView() {
        view = addQuestPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add New Quest"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onSubmitTapped))
    }
    
    
    @objc func onSubmitTapped() {
        // Add a new document in collection "cities"
        
        // Check data are correct
        if let titleContent = addQuestPage.titleBlock.text,
            let descriptionContent = addQuestPage.descriptionBlock.text,
           titleContent != "", descriptionContent != ""{
            
            let pts = Int(addQuestPage.pointSlider.value)
            
            db.collection("userData")
                .document(currentUser!.email.lowercased())
                .collection("Quest")
                .addDocument(data: [
                    "title": titleContent,
                    "description": descriptionContent,
                    "rewardPts":pts,
                    "time": Int64(Date().timeIntervalSince1970)
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
                    title: "Error!", message: "Title and Description cannot be empty",
                    preferredStyle: .alert
                )
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true)
        }
        
    }
    

}
