//
//  User.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    @DocumentID var id: String?
    var email: String
    var name: String
    var totalPts: Int
    
    init(email: String, name: String) {
        self.email = email
        self.name = name
        self.totalPts = 0
    }
}
