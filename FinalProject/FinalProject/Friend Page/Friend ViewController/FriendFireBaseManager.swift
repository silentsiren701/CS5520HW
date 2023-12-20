//
//  FriendFireBaseManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/8/23.
//


import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import NotificationCenter

extension FriendViewController {
    
    func setFriendListener() {
        db.collection("userData")
          .document(currentUser!.email.lowercased())
          .collection("Friend")
          .addSnapshotListener(includeMetadataChanges: false, listener: {
              querySnapshot, error in
              if error == nil{
                  if let documents = querySnapshot?.documents{
                      self.friendList.removeAll()
                      for document in documents{
                          do {
                              let friend  = try document.data(as: Friend.self)
                              self.friendList.append(friend)
                              
                          }catch{
                              print(error)
                          }
                      }
                      
                      self.friendList.sort(by: {
                          $0.time < $1.time
                      })
                      
//                      self.chatScreen.tableViewMessages.reloadData()
                      if !self.friendList.isEmpty {
//                          self.scrollToBottom()
                      }
                      
                      print("Current messages: \(self.friendList)")
                      self.notificationCenter.post(
                          name: .FriendsLoad,
                          object: nil)
                      
                  }
              }else{
                  
              }
          })
    }
    
    
    
    
    func setUserListener() {
        if let currentUserEmail = Auth.auth().currentUser?.email {
            db.collection("users")
                .document(currentUserEmail.lowercased())
                .addSnapshotListener { documentSnapshot, error in
                    // Check for errors
                    if let error = error {
                        print("Error getting document: \(error)")
                        return
                    }
                    
                    // Ensure the documentSnapshot exists and is not empty
                    guard let documentSnapshot = documentSnapshot, documentSnapshot.exists else {
                        print("User does not exist")
                        return
                    }
                    
                    // Convert the document snapshot to a User struct
                    do {
                        self.currentUser = try documentSnapshot.data(as: User.self)
                        
                        self.notificationCenter.post(
                            name: .FriendUserLoad,
                            object: nil)
                        
                    } catch let error {
                        print("Error decoding user: \(error)")
                    }
                }
        }
    }
}
