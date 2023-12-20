//
//  ViewController.swift
//  WA3_Xu_9492
//
//  Created by Aiden Hsu on 9/29/23.
//

import UIKit

class ViewController: UIViewController {
    
    let firstScreen = FirstScreenView()
    
    let phoneType: [String] = ["Cell", "Work", "Home"]
    
    var selectedType = "Cell"
    
    public struct Package {
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
    
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstScreen.phoneTypePicker.delegate = self
        firstScreen.phoneTypePicker.dataSource = self

        firstScreen.submitButton.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func onButtonSubmitTapped(){
        let unwarppedName = firstScreen.nameField.text!
        let unwarppedEmail = firstScreen.emailField.text!
        let unwarppedPhoneNumber = firstScreen.phoneNumberField.text!
        let unwarppedAddress = firstScreen.addressField.text!
        let unwarppedCityAndState = firstScreen.cityAndStateField.text!
        let unwarppedZip = firstScreen.zipField.text!
        
        
        if unwarppedName.isEmpty {
            EmptyError(fieldName: "Name")
        }
        
        else if unwarppedEmail.isEmpty {
            EmptyError(fieldName: "Email")
        } else if !isValidEmail(unwarppedEmail) {
            otherError(content: "Email Address is invalid")
        }
        
        else if unwarppedPhoneNumber.isEmpty {
            EmptyError(fieldName: "PhoneNumber")
        } else if !(unwarppedPhoneNumber.count == 10) {
            otherError(content: "Phone number is invalid")
        }
        
        else if unwarppedAddress.isEmpty {
            EmptyError(fieldName: "Address")
        }
        
        else if unwarppedCityAndState.isEmpty {
            EmptyError(fieldName: "City, State")
        }
        
        else if unwarppedZip.isEmpty {
            EmptyError(fieldName: "Zip")
        } else if !(Int(unwarppedZip) ?? 0 <= 99950) || !(unwarppedZip.count == 5) {
            otherError(content: "Zip number is invalid")
        }
        
        else {
            let package = Package(name: unwarppedName, email: unwarppedEmail, phoneType: selectedType, phoneNumber: unwarppedPhoneNumber, address: unwarppedAddress, cityAndState: unwarppedCityAndState, zip: unwarppedZip)
            
            let displayViewController = resultViewController()
            
            displayViewController.receivedPackage = package;
            
            navigationController?.pushViewController(displayViewController, animated: true)
            
        }
        
        
        //instantiating displayViewController...
        // let displayViewController = DisplayViewController()
        
        //setting the to be sent package...
        // displayViewController.receivedPackage = package
        
        //pushing displayController to navigation controller...
        // navigationController?.pushViewController(displayViewController, animated: true)

    }

    
    func EmptyError(fieldName: String) {
        let alert = UIAlertController(title: "Error!", message: "The \(fieldName) cannot be empty!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func otherError(content: String) {
        let alert = UIAlertController(title: "Error!", message: content, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    
    // Citation: https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    //returns the number of columns/components in the Picker View...
    func numberOfComponents(in phoneTypePicker: UIPickerView) -> Int {
        return 1
    }
    
    //returns the number of rows in the current component...
    func pickerView(_ phoneTypePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return phoneType.count
    }
    
    //set the title of currently picked row...
    func pickerView(_ phoneTypePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // on change selection, update selectedMood...
        selectedType = phoneType[row]
        return phoneType[row]
    }
}
