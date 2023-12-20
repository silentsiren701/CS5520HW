//
//  AddContactViewController.swift
//  WA4_Xu_9492
//
//  Created by Aiden Hsu on 10/6/23.
//

import UIKit

class AddContactViewController: UIViewController {
    
    var delegate:ViewController!
    
    var selectedType = "Cell"
    
    let addContactScreen = AddContactView()
    
    override func loadView() {
        view = addContactScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addContactScreen.phoneTypePicker.delegate = self
        addContactScreen.phoneTypePicker.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(onSaveBarButtonTapped)
        )
            
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func onSaveBarButtonTapped() {
        let unwarppedName = addContactScreen.nameField.text!
        let unwarppedEmail = addContactScreen.emailField.text!
        let unwarppedPhoneNumber = addContactScreen.phoneNumberField.text!
        let unwarppedAddress = addContactScreen.addressField.text!
        let unwarppedCityAndState = addContactScreen.cityAndStateField.text!
        let unwarppedZip = addContactScreen.zipField.text!
        
        
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
            let Contact = Contacts(name: unwarppedName, email: unwarppedEmail, phoneType: selectedType, phoneNumber: unwarppedPhoneNumber, address: unwarppedAddress, cityAndState: unwarppedCityAndState, zip: unwarppedZip)
            
            
            delegate.delegateOnAddContact(Contact: Contact)
            navigationController?.popViewController(animated: true)
        }
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
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }

}

extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    //returns the number of columns/components in the Picker View...
    func numberOfComponents(in phoneTypePicker: UIPickerView) -> Int {
        return 1
    }
    
    //returns the number of rows in the current component...
    func pickerView(_ phoneTypePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PhoneType.types.count
    }
    
    //set the title of currently picked row...
    func pickerView(_ phoneTypePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // on change selection, update selectedMood...
        selectedType = PhoneType.types[row]
        return PhoneType.types[row]
    }
}
