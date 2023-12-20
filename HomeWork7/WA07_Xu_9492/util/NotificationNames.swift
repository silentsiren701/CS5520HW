//
//  NotificationNames.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/3/23.
//

import Foundation

import Foundation
extension Notification.Name{
    static let tokenRecieved = Notification.Name("tokenRecieved")
    static let notesRecieved = Notification.Name("notesRecieved")
    
    static let posted = Notification.Name("posted")
    static let deleted = Notification.Name("deleted")
    static let edited = Notification.Name("edited")
    static let deletedForEditing = Notification.Name("deletedForEditing")
}
