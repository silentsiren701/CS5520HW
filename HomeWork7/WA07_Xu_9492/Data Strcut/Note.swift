//
//  Note.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/4/23.
//

import Foundation

struct Note: Codable{
    var _id: String
    var userId: String
    var text: String
    var __v: Int
    
    init(_id: String, userId: String, text: String, __v: Int) {
        self._id = _id
        self.userId = userId
        self.text = text
        self.__v = __v
    }
}

struct Notes: Codable{
    var notes: [Note]
    init(Notes: [Note]) {
        self.notes = Notes
    }
}

struct AddNote: Codable{
    var posted: Bool
    var note: Note
    
    init(posted: Bool, note: Note) {
        self.posted = posted
        self.note = note
    }
}

struct DeleteNote: Codable{
    var delete: Bool
    var message: String
    
    init(delete: Bool, message: String) {
        self.delete = delete
        self.message = message
    }
}
