//
//  AuthTokenProtocol.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/2/23.
//

import Foundation

// MARK: This protocol is used for create an new account
protocol AuthTokenRegisterProtocol{
    func register(name: String, email: String, password: String)
}

// MARK: This protocol is used for signning in an existing account
protocol AuthTokenSignInProtocol{
    func login(email:String, password:String)
}


protocol GetProfileProtocol{
    func getProfile(token: String)
}

protocol logoutProtocol{
    func logout(token: String)
}
