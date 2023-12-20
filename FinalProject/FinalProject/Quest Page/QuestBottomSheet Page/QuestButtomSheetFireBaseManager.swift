//
//  QuestButtomSheetFireBaseManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/8/23.
//


import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import NotificationCenter

extension QuestBottomSheetViewController {
    func deleteQuest() {
        if let questID = myQuest?.id{
            db.collection("userData")
                .document(currentUser!.email.lowercased())
                .collection("Quest")
                .document(questID)
                .delete() { err in
                    if let err = err {
                      print("Error removing document: \(err)")
                    } else {
                      print("Quest successfully removed!")
                    }
                  }
        }
    }
    
    func finishQuest() {
        // Update points
        db.collection("users")
            .document(currentUser!.email.lowercased())
            .updateData([
                "totalPts": currentUser!.totalPts + myQuest!.rewardPts
        ]) { err in
          if let err = err {
            print("Error updating document: \(err)")
          } else {
            print("user score incremented!")
          }
        }
        deleteQuest()
        
    }
}
