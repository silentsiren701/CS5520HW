//
//  FriendButtomSheetFireBaseManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/12/23.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import NotificationCenter

extension FriendBottomSheetViewController {
    func deleteFriend() {
        if let friendID = myFriend?.id{
            db.collection("userData")
                .document(currentUser!.email.lowercased())
                .collection("Friend")
                .document(friendID)
                .delete() { err in
                    if let err = err {
                      print("Error removing document: \(err)")
                    } else {
                      print("Friend successfully removed!")
                    }
                  }
        }
    }
    
    func giftFriend() {
        if let friendID = myFriend?.id{
            let docRef = db.collection("userData").document(currentUser!.email.lowercased()).collection("Friend").document(friendID)
            
            docRef.getDocument { (document, error) in
               guard error == nil else {
                   print("error", error ?? "")
                   return
               }

               if let document = document, document.exists {
                   let data = document.data()
                   if let data = data {
                       print("Friend Data", data)
                       //self.restaurant = data["name"] as? String ?? ""
                       let giftingFriend = data["email"] as? String ?? ""
                       let giftingFriendTime = data["time"] as? Int64 ?? 0
                       
                       let docRef2 = self.db.collection("users").document(giftingFriend.lowercased())
                       
                       docRef2.getDocument { (document2, error) in
                           guard error == nil else {
                               print("error", error ?? "")
                               return
                           }
                           
                           if let document2 = document2, document2.exists {
                               let data2 = document2.data()
                               if let data2 = data2 {
                                   print("Gifted User", data2)
                                   let giftingFriendPoints = data2["totalPts"] as? Int ?? 0
                                   //self.currentUser!.totalPts
                                   
                                   
                                   if (Int64(Date().timeIntervalSince1970) - giftingFriendTime > 86400) {
                                       self.db.collection("users")
                                           .document(giftingFriend.lowercased())
                                       .updateData([
                                        "totalPts": giftingFriendPoints + 1
                                       ]) { err in
                                           if let err = err {
                                               print("Error updating document: \(err)")
                                           } else {
                                               print("user score incremented!")
                                           }
                                       }
                                       self.db.collection("userData")
                                           .document(self.currentUser!.email.lowercased())
                                           .collection("Friend")
                                           .document(self.myFriend!.id!)
                                           .updateData([
                                               "time": Int64(Date().timeIntervalSince1970)
                                           ]) { err in
                                               if let err = err {
                                                   print("Error updating time: \(err)")
                                               } else {
                                                   print("Time successfully changed!")
                                                   
                                                   self.notificationCenter.post(
                                                       name: .FriendEdited,
                                                       object: nil)
                                                   self.dismiss(animated: true)
                                               }
                                           }
                                   } else {
                                       print("Insufficient time elapsed")
                                       let alert = UIAlertController(
                                               title: "Error!", message: "You can only send each friend one gift per day",
                                               preferredStyle: .alert
                                           )
                                           
                                           alert.addAction(UIAlertAction(title: "OK", style: .default))
                                           
                                           self.present(alert, animated: true)
                                   }
                               }
                           } else {
                               let alert = UIAlertController(
                                       title: "Error!", message: "There is no account with this email",
                                       preferredStyle: .alert
                                   )
                                   
                                   alert.addAction(UIAlertAction(title: "OK", style: .default))
                                   
                                   self.present(alert, animated: true)
                           }
                       }
                   }
               }
        }
        
//        if let friendID = myFriend?.id{
//            let giftingFriend = db.collection("userData")
//                .document(currentUser!.email.lowercased())
//                .collection("Friend")
//                .document(friendID)
//                .
//            do {
//                print(giftingFriend.value(forKey: "email"))
//
//
//            }catch{
//                print(error)
//            }
//            if true {
//                db.collection("users")
//                    .document(giftingFriend.email)
//                .updateData([
//                    "totalPts": currentUser!.totalPts + 12
//                ]) { err in
//                    if let err = err {
//                        print("Error updating document: \(err)")
//                    } else {
//                        print("user score incremented!")
//                    }
//                }
//            }
        }

    }
}
