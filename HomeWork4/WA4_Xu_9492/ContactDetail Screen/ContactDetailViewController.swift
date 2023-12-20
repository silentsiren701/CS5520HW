//
//  ContactDetailViewController.swift
//  WA4_Xu_9492
//
//  Created by Aiden Hsu on 10/6/23.
//

import UIKit

class ContactDetailViewController: UIViewController {
    let displayScreen = ContactDetailView();
    
    override func loadView() {
        view = displayScreen
    }
    
    var receivedContacts: Contacts = Contacts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: setting the Labels' texts...
        if let unwrappedName = receivedContacts.name{
            if !unwrappedName.isEmpty{
                displayScreen.labelName.text = unwrappedName
            }
        }
        
        if let unwrappedEmail = receivedContacts.email{
            if !unwrappedEmail.isEmpty{
                displayScreen.labelEmail.text = "Email: \(unwrappedEmail)"
            }
        }
        
        let unwrappedPhoneType = receivedContacts.phoneType!
        let unwrappedPhoneNumber = receivedContacts.phoneNumber!
        
        if !unwrappedPhoneNumber.isEmpty{
            displayScreen.labelPhone.text = "Phone: \(unwrappedPhoneNumber) (\(unwrappedPhoneType))"
        }
        
        if let unwrappedAddress = receivedContacts.address{
            if !unwrappedAddress.isEmpty{
                displayScreen.labelAddress.text = unwrappedAddress
            }
        }
        
        if let unwrappedCityAndState = receivedContacts.cityAndState{
            if !unwrappedCityAndState.isEmpty{
                displayScreen.labelCityAndStates.text = "\(unwrappedCityAndState)"
            }
        }
        
        if let unwrappedZip = receivedContacts.zip{
            if !unwrappedZip.isEmpty{
                displayScreen.labelZip.text = unwrappedZip
            }
        }
    }

}
