//
//  FriendNotificationManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/8/23.
//

import Foundation
import NotificationCenter

extension Notification.Name{
    static let FriendUserLoad = Notification.Name("FriendUserLoad")
    static let FriendsLoad = Notification.Name("FriendsLoad")
    static let FriendEdited = Notification.Name("FriendEditted")
//    static let sendTimeError = Notification.Name("sendTimeError")
}

extension FriendViewController {
    // MARK: - set User
    func setUserLoadObserver() {
        self.notificationCenter.addObserver(
            self, selector: #selector(userLoadFinish(notification:)),
            name: .FriendUserLoad,
            object: nil)
    }
    
    @objc func userLoadFinish(notification: Notification) {
        // When we finished load User
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { //Tries to load too fast and crashes without this
            self.setUserData()
            
            self.setFriendsLoadObserver()
            self.setFriendListener()
         }
        
    }
    
    // MARK: - set Friends
    func setFriendsLoadObserver() {
        self.notificationCenter.addObserver(
            self, selector: #selector(FriendsLoadFinish(notification:)),
            name: .FriendsLoad,
            object: nil)
    }
    
    @objc func FriendsLoadFinish(notification: Notification) {
        // When we finished load User
        self.friendView.tableViewFriends.reloadData()
    }
    
//    func sendTimeErrorObserver() {
//        self.notificationCenter.addObserver(
//            self, selector: #selector(sendTimeError(notification:)),
//            name: .sendTimeError,
//            object: nil)
//    }
//
//    @objc func sendTimeError(notification: Notification) {
//        // When we finished load User
//        let alert = UIAlertController(
//                title: "Error!", message: "Please wait a day between sending gifts.",
//                preferredStyle: .alert
//            )
//
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//
//        self.present(alert, animated: true)
//    }
}
