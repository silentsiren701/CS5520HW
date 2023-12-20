//
//  RewardBottomSheetFirebaseManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import NotificationCenter

extension RewardBottomSheetViewController {
    func deleteReward() {
        if let rewardID = myReward?.id{
            db.collection("userData")
                .document(currentUser!.email.lowercased())
                .collection("Reward")
                .document(rewardID)
                .delete() { err in
                    if let err = err {
                      print("Error removing document: \(err)")
                    } else {
                      print("Reward successfully removed!")
                    }
                  }
        }
    }
    
    func finishReward() {
        // Update points
        db.collection("users")
            .document(currentUser!.email.lowercased())
            .updateData([
                "totalPts": currentUser!.totalPts - myReward!.rewardPts
        ]) { err in
          if let err = err {
            print("Error updating document: \(err)")
          } else {
            print("user score incremented!")
          }
        }
        deleteReward()
        
    }
}
