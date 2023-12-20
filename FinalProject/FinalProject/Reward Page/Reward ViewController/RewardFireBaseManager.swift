//
//  RewardFireBaseManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import NotificationCenter

extension RewardViewController {
    
    func setRewardListener() {
        db.collection("userData")
          .document(currentUser!.email.lowercased())
          .collection("Reward")
          .addSnapshotListener(includeMetadataChanges: false, listener: {
              querySnapshot, error in
              if error == nil{
                  if let documents = querySnapshot?.documents{
                      self.rewardList.removeAll()
                      for document in documents{
                          do {
                              let reward  = try document.data(as: Reward.self)
                              self.rewardList.append(reward)
                              
                          }catch{
                              print(error)
                          }
                      }
                      
                      self.rewardList.sort(by: {
                          $0.time < $1.time
                      })
                      
//                      self.chatScreen.tableViewMessages.reloadData()
                      if !self.rewardList.isEmpty {
//                          self.scrollToBottom()
                      }
                      
                      print("Current messages: \(self.rewardList)")
                      self.notificationCenter.post(
                          name: .RewardsLoad,
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
                            name: .RewardUserLoad,
                            object: nil)
                        
                    } catch let error {
                        print("Error decoding user: \(error)")
                    }
                }
        }
    }
}
