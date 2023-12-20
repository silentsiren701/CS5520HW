//
//  NoteProtocol.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/4/23.
//

import Foundation

// MARK: This protocol is used for create an new account
protocol GetAllNoteProtocol{
    func getall(token: String)
}

protocol PostNoteProtocol{
    func post(token: String, text: String)
}

protocol deleteNoteProtocol{
    func delete(token: String, note: Note)
}
