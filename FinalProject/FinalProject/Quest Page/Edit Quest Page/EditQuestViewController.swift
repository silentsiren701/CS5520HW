//
//  EditQuestViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/8/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class EditQuestViewController: UIViewController {

    var currentUser: User?
    var myQuest: Quest?
    
    let db = Firestore.firestore()
    let notificationCenter = NotificationCenter.default
    let ediQustView = EditQuestView()
        
    override func loadView() {
        view = ediQustView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Edit Quest"
        
        ediQustView.pointSlider.value = Float(myQuest!.rewardPts)
        ediQustView.titleBlock.text = myQuest!.title
        ediQustView.descriptionBlock.text = myQuest!.description
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSubmitTapped))
    }
    
    
    @objc func onSubmitTapped() {
        // Add a new document in collection "cities"
        
        // Check data are correct
        if let titleContent = ediQustView.titleBlock.text,
            let descriptionContent = ediQustView.descriptionBlock.text,
           titleContent != "", descriptionContent != ""{
            
            let pts = Int(ediQustView.pointSlider.value)
            
            db.collection("userData")
                .document(currentUser!.email.lowercased())
                .collection("Quest")
                .document(myQuest!.id!)
                .updateData([
                    "title": titleContent,
                    "description": descriptionContent,
                    "rewardPts":pts
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {                 
                        self.navigationController?.popViewController(animated: true)
                        print("Document successfully written!")
                        
                        self.notificationCenter.post(
                            name: .QuestEdited,
                            object: nil)
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
