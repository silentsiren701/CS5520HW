//
//  RegisterPageViewController.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/2/23.
//

import UIKit
import Alamofire

class RegisterPageViewController: UIViewController {
    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let registerPage = RegisterPageView()
    
    override func loadView() {
        view = registerPage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: add action to loginButton
        registerPage.loginButton.addTarget(self, action: #selector(onloginButtonTapped), for: .touchUpInside)
        
    }
    
    // MARK: Give functionbility to registerButton
    @objc func onloginButtonTapped() {
        if(!isValidEmail(registerPage.emailFeild.text!)) {
            let alert = UIAlertController(title: "Error!", message: "The email is illegal", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
        } else {
            register(name:registerPage.nameFeild.text!, email: registerPage.emailFeild.text!, password: registerPage.pwFeild.text!)
            
            notificationCenter.addObserver(
                self,
                selector: #selector(setToken(notification:)),
                name:.tokenRecieved,
                object: nil)
        }
    }
    
    func getPageData() -> [String]? {
        if let unwarppedName = registerPage.nameFeild.text,
           let unwarppedEmail = registerPage.emailFeild.text,
           let unwarppedPw = registerPage.pwFeild.text {
            return [unwarppedName, unwarppedEmail, unwarppedPw]
        }
        return nil
    }
    
    @objc func setToken(notification: Notification){
        defaults.set(notification.object as! String, forKey: "AuthToken")
        print("Auth Token now set as \(notification.object as! String)")
        
        pushOutNotesPage(animated: true)
    }
    
    func pushOutNotesPage(animated: Bool) {
        let notesPage = NotesPageViewController()
        navigationController?.pushViewController(notesPage, animated: animated)
    }
    
    // Citation: https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
