//
//  Contacts.swift
//  WA4_Xu_9492
//
//  Created by Aiden Hsu on 10/6/23.
//

import Foundation

public struct Contacts {
    var name: String?
    var email: String?
    var phoneType: String?
    var phoneNumber: String?;
    var address: String?;
    var cityAndState: String?;
    var zip: String?;
    
    init(name: String? = nil, email: String? = nil, phoneType: String? = nil, phoneNumber: String? = nil,
         address: String? = nil, cityAndState: String? = nil, zip: String? = nil) {
        
        self.name = name
        self.email = email
        self.phoneType = phoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.cityAndState = cityAndState
        self.zip = zip
    }
}
