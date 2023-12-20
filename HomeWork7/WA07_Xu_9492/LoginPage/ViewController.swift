//
//  ViewController.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let loginPage = LoginPageView()
    
    override func loadView() {
        view = loginPage


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (checkLogin()) {
            // MARK: we have logged in already， Push notesPage out
            pushOutNotesPage(animated: false)
        }
        
        //MARK: add action to ButtonDelete and loginButton
        loginPage.registerButton.addTarget(self, action: #selector(onButtonDeleteTapped), for: .touchUpInside)
        loginPage.loginButton.addTarget(self, action: #selector(onLoginButtonTapped), for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: Give functionbility to registerButton
    @objc func onButtonDeleteTapped() {
        let registerPage = RegisterPageViewController()
        navigationController?.pushViewController(registerPage, animated: true)
    }
    
    // MARK: Give functionbility to LoginButton
    @objc func onLoginButtonTapped() {
        login(email: loginPage.emailFeild.text!, password: loginPage.pwFeild.text!)
        
        notificationCenter.addObserver(
            self,
            selector: #selector(setToken(notification:)),
            name:.tokenRecieved,
            object: nil)
    }
    //codes omitted...
    @objc func setToken(notification: Notification){
        defaults.set(notification.object as! String, forKey: "AuthToken")
        print("Auth Token now set as \(notification.object as! String)")
        
        pushOutNotesPage(animated: true)
    }
    
    func getToken() -> String? {
        let AuthTokenSaved = defaults.object(forKey: "AuthToken") as! String?
        
        if let token = AuthTokenSaved{
            //MARK: tasks if there is a key saved
            print("The Saved Auth Token: \(token)")
            return token
        }
        return nil
    }
    
    func pushOutNotesPage(animated: Bool) {
        let notesPage = NotesPageViewController()
        navigationController?.pushViewController(notesPage, animated: animated)
    }
    
    
    
    // MARK: Check if already signed in
    func checkLogin() -> Bool {
        return getToken() != nil
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
}

