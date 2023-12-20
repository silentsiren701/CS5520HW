//
//  EditNoteViewController.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/5/23.
//

import UIKit

class EditNoteViewController: UIViewController {

    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let notesCreatePage = NotesCreateView()
    var myNote: Note?
    
    override func loadView() {
        view = notesCreatePage
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Note"
        
        notesCreatePage.submitButton.addTarget(self, action: #selector(onnotesPageTapped), for: .touchUpInside)
    }
    
    func initData(note: Note) {
        notesCreatePage.textBox.text = note.text
        myNote = note
    }
    
    @objc func onnotesPageTapped() {
        if var unwapNote = myNote {
            unwapNote.text = notesCreatePage.textBox.text
            edit(token: getToken()!, note:unwapNote)
        }
    }
    
    @objc func getToken() -> String? {
        return defaults.object(forKey: "AuthToken") as! String?
    }

}
