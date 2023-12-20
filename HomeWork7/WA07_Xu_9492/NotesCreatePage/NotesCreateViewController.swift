//
//  NotesCreateViewController.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/5/23.
//

import UIKit
import Alamofire

class NotesCreateViewController: UIViewController {
    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let notesCreatePage = NotesCreateView()
    
    override func loadView() {
        view = notesCreatePage
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Note"
        
        notesCreatePage.submitButton.addTarget(self, action: #selector(onnotesPageTapped), for: .touchUpInside)
    }
    
    @objc func onnotesPageTapped() {
        post(token: getToken()!, text: notesCreatePage.textBox.text!)
    }
    
    @objc func getToken() -> String? {
        return defaults.object(forKey: "AuthToken") as! String?
    }

}
