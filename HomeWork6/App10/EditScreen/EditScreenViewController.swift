//
//  EditScreenViewController.swift
//  App10
//
//  Created by Aiden Hsu on 10/27/23.
//

import UIKit

class EditScreenViewController: UIViewController {
    let displayScreen = EditScreenView();
    
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    var contactDetail: Contact?;
    var originalName: String?;
    
    override func loadView() {
        view = displayScreen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        //MARK: add action to ButtonDelete
        displayScreen.ButtonSave.addTarget(self, action: #selector(onButtonSaveTapped), for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func setupView() {
        if let unwrappedContact = contactDetail {
            originalName = unwrappedContact.name
            displayScreen.fieldName.text = unwrappedContact.name
            displayScreen.fieldEmail.text = unwrappedContact.email
            displayScreen.fieldPhone.text = String(unwrappedContact.phone)
        }
    }

    @objc func onButtonSaveTapped() {
        
        var text = "EDIT" + ","
        if let unwarppedOriginalName =  originalName, 
            let unwarppedName =  displayScreen.fieldName.text,
            let unwarppedEmail =  displayScreen.fieldEmail.text,
            let unwarppedPhone =  displayScreen.fieldPhone.text{
            
            if let contact = dataToContact(name: unwarppedName, email: unwarppedEmail, phone: unwarppedPhone) {
                text += unwarppedOriginalName + "," + unwarppedName + "," + unwarppedEmail + "," + unwarppedPhone
                notificationCenter.post(
                                name: Notification.Name("orderFromDetailScreen"),
                                object: text)
                navigationController?.popViewController(animated: true)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    
    func dataToContact(name:String, email:String, phone:String) -> Contact? {
        if name.isEmpty {
            EmptyError(fieldName: "Name")
        }
        
        else if email.isEmpty {
            EmptyError(fieldName: "Email")
        } else if !isValidEmail(email) {
            otherError(content: "Email Address is invalid")
        }
        
        
        else if phone.isEmpty {
            EmptyError(fieldName: "PhoneNumber")
        } else if !(phone.count == 10) {
            otherError(content: "Phone number is invalid")
        } else {
            return Contact(name: name, email: email, phone: Int(phone)!)
        }
        return nil
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
