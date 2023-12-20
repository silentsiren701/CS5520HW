//
//  Friend.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import Foundation
import FirebaseFirestoreSwift

class Friend: Codable {
    @DocumentID var id: String?
    var email: String
    var time: Int64
    //        db.collection("users")
    //            .document("bobjones1@gmail.com")
    //            .updateData([
    //                "totalPts": currentUser!.totalPts + 12
    //        ]) { err in
    //          if let err = err {
    //            print("Error updating document: \(err)")
    //          } else {
    //            print("user score incremented!")
    //          }
    //        }
    
    
//    do {
//        try FirebaseAuth.Auth.auth().signOut()
//
//
//    } catch let signOutError as NSError {
//        print("Error signing out: %@", signOutError)
//        // Handle error, maybe show an alert to the user
//    }

    init(email: String, time: Int64) {
        self.email = email
        self.time = time
    }
}
