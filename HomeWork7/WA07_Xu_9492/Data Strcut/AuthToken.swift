//
//  AuthToken.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/2/23.
//

import Foundation

struct AuthToken: Codable{
    var auth: Bool
    var token: String
    
    init(auth: Bool, token: String) {
        self.auth = auth
        self.token = token
    }
}


struct User: Codable{
    var _id: String
    var name: String
    var email: String
    var __v: Int
    
    init(_id: String, name: String, email: String, __v: Int) {
        self._id = _id
        self.name = name
        self.email = email
        self.__v = __v
    }
}

