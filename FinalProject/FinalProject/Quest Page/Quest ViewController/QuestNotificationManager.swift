//
//  QuestNotificationNames.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/7/23.
//

import Foundation
import NotificationCenter

extension Notification.Name{
    static let QuestUserLoad = Notification.Name("QuestUserLoad")
    static let QuestsLoad = Notification.Name("QuestsLoad")
    static let QuestEdited = Notification.Name("QuestEditted")
}

extension QuestViewController {
    // MARK: - set User
    func setUserLoadObserver() {
        self.notificationCenter.addObserver(
            self, selector: #selector(userLoadFinish(notification:)),
            name: .QuestUserLoad,
            object: nil)
    }
    
    
    @objc func userLoadFinish(notification: Notification) {
        // When we finished load User
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {  //Tries to load too fast and crashes without this
            self.setUserData()
            
            self.setQuestsLoadObserver()
            self.setQuestListener()
        }
        
    }
    
    // MARK: - set Quests
    func setQuestsLoadObserver() {
        self.notificationCenter.addObserver(
            self, selector: #selector(QuestsLoadFinish(notification:)),
            name: .QuestsLoad,
            object: nil)
    }
    
    @objc func QuestsLoadFinish(notification: Notification) {
        // When we finished load User
        self.questView.tableViewQuests.reloadData()
    }
}
