//
//  Reward.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Reward: Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var rewardPts: Int
    var time: Int64
    var photoURL: URL
    
    init(title: String, description: String, rewardPts: Int, time: Int64, photoURL: URL) {
        self.title = title
        self.description = description
        self.rewardPts = rewardPts
        self.time = time
        self.photoURL = photoURL
    }
    
//    init(title: String, description: String, rewardPts: Int, time: Int64) {
//        self.title = title
//        self.description = description
//        self.rewardPts = rewardPts
//        self.time = time
//        let tempURL = URL(string: "https://firebasestorage.googleapis.com:443/v0/b/cs5520project-f3071.appspot.com/o/imagesRewards%2F8C2DA1BF-B48C-43D5-B7D2-07321C5A9DA0.jpg?alt=media&token=24ffb7cd-2e2c-4fcc-8b01-3be2c36d5411")
//        self.photoURL = tempURL!
//    }
}
