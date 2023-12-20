//
//  Quest.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/6/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Quest: Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var rewardPts: Int
    var time: Int64
    
    init(title: String, description: String, rewardPts: Int, time: Int64) {
        self.title = title
        self.description = description
        self.rewardPts = rewardPts
        self.time = time
    }
}
