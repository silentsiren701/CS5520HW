//
//  QuestBottomSheetViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/7/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class QuestBottomSheetViewController: UIViewController {
    var currentUser: User?
    var myQuest: Quest?

    let db = Firestore.firestore()
    let notificationCenter = NotificationCenter.default
    let questBottomSheetPage = QuestBottomSheetView()
        
    override func loadView() {
        view = questBottomSheetPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpQuest()
        
        questBottomSheetPage.deleteButton.addTarget(self, action: #selector(onDeleteButtonTapped), for: .touchUpInside)
        questBottomSheetPage.finishButton.addTarget(self, action: #selector(onFinishButtonTapped), for: .touchUpInside)
        questBottomSheetPage.EditButton.addTarget(self, action: #selector(onEditButtonTapped), for: .touchUpInside)
        
    }
    
    func setUpQuest() {
        if let thisQuest = myQuest {
            questBottomSheetPage.titleBlock.text = thisQuest.title
            questBottomSheetPage.pointBlock.text = "\(thisQuest.rewardPts)Pts"
            questBottomSheetPage.descriptionBlock.text = thisQuest.description
        }
    }


}
