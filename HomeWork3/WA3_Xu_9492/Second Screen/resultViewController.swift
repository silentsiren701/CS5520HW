//
//  resultViewController.swift
//  WA3_Xu_9492
//
//  Created by Aiden Hsu on 9/29/23.
//

import UIKit

class resultViewController: UIViewController {
    
    let displayScreen = resultView();
    
    override func loadView() {
        view = displayScreen
    }
    
    var receivedPackage: ViewController.Package = ViewController.Package()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: setting the Labels' texts...
        if let unwrappedName = receivedPackage.name{
            if !unwrappedName.isEmpty{
                displayScreen.labelName.text = "Name: \(unwrappedName)"
            }
        }
        
        if let unwrappedEmail = receivedPackage.email{
            if !unwrappedEmail.isEmpty{
                displayScreen.labelEmail.text = "Email: \(unwrappedEmail)"
            }
        }
        
        let unwrappedPhoneType = receivedPackage.phoneType!
        let unwrappedPhoneNumber = receivedPackage.phoneNumber!
        
        if !unwrappedPhoneNumber.isEmpty{
            displayScreen.labelPhone.text = "Phone: \(unwrappedPhoneNumber) (\(unwrappedPhoneType))"
        }
        
        if let unwrappedAddress = receivedPackage.address{
            if !unwrappedAddress.isEmpty{
                displayScreen.labelAddress.text = "Address: \(unwrappedAddress)"
            }
        }
        
        if let unwrappedCityAndState = receivedPackage.cityAndState{
            if !unwrappedCityAndState.isEmpty{
                displayScreen.labelCityAndStates.text = "\(unwrappedCityAndState)"
            }
        }
        
        if let unwrappedZip = receivedPackage.zip{
            if !unwrappedZip.isEmpty{
                displayScreen.labelZip.text = "ZIP: \(unwrappedZip)"
            }
        }
        
        displayScreen.imagePhone.image = UIImage(named: unwrappedPhoneType.lowercased())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
