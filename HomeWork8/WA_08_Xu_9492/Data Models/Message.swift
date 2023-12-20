//
//  Message.swift
//  WA_08_Xu_9492
//
//  Created by Aiden Hsu on 11/15/23.
//

import Foundation

struct Message: Codable {
    var Received: Bool
    var Time: Date
    var Text: String
}


struct MessageRoom: Codable {
    // the name of this Room will be the guest's ID
    var guest: User
    var Messages: [Message]
}
