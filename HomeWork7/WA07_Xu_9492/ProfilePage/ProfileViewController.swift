//
//  ProfileViewController.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/5/23.
//

import UIKit

class ProfileViewController: UIViewController {

    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let profilePage = ProfileView()
    
    override func loadView() {
        view = profilePage
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        if let token = getToken() {
            print(token)
            getProfile(token: token)
            
        }
    }
    
    func initData(user: User) {
        print("?")
        profilePage.emailContentLabel.text = user.email
        profilePage.nameContentLabel.text = user.name
        profilePage.idContentLabel.text = user._id
    }
    
    func getToken() -> String? {
        let AuthTokenSaved = defaults.object(forKey: "AuthToken") as! String?
        
        if let token = AuthTokenSaved{
            //MARK: tasks if there is a key saved
            return token
        }
        return nil
    }
//
//    @objc func onnotesPageTapped() {
//        if var unwapNote = myNote {
//            unwapNote.text = notesCreatePage.textBox.text
//            edit(token: getToken()!, note:unwapNote)
//        }
//    }
//    
//    @objc func getToken() -> String? {
//        return defaults.object(forKey: "AuthToken") as! String?
//    }

}
