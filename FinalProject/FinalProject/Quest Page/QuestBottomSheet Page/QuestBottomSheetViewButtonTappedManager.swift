//
//  QuestBottomSheetViewButtonTappedManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/8/23.
//

import Foundation

extension QuestBottomSheetViewController {
    @objc func onDeleteButtonTapped() {
        deleteQuest()
        dismiss(animated: true)
    }
    
    @objc func onFinishButtonTapped() {
        finishQuest()
        dismiss(animated: true)
    }
    
    @objc func onEditButtonTapped() {
        let editQuestPage = EditQuestViewController()
        editQuestPage.currentUser = currentUser
        editQuestPage.myQuest = myQuest
        
        self.notificationCenter.addObserver(
            self, selector: #selector(editFinish(notification:)),
            name: .QuestEdited,
            object: nil)
        
        self.navigationController?.pushViewController(editQuestPage, animated: true)
    }
    
    @objc func editFinish(notification:Notification) {
        dismiss(animated: true)
    }
}
