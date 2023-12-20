//
//  ContactsDetailViewController.swift
//  App10
//
//  Created by Aiden Hsu on 10/27/23.
//

import UIKit

class ContactsDetailViewController: UIViewController {
    let displayScreen = ContactsDetailView();
    
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    var contactDetail: Contact?;
    
    override func loadView() {
        view = displayScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit, target: self,
            action: #selector(onEditBarButtonTapped)
        )
        
        //MARK: add action to ButtonDelete
        displayScreen.ButtonDelete.addTarget(self, action: #selector(onButtonDeleteTapped), for: .touchUpInside)
    }
    
    func setupView() {
        if let unwrappedContact = contactDetail {
            displayScreen.labelName.text = unwrappedContact.name
            displayScreen.labelEmail.text = unwrappedContact.email
            displayScreen.labelPhone.text = String(unwrappedContact.phone)
        }
    }
    
    @objc func onEditBarButtonTapped(){
        let editScreen = EditScreenViewController()
        editScreen.contactDetail = contactDetail
        // Push the detail view controller
        navigationController?.pushViewController(editScreen, animated: true)
    }
    
    @objc func onButtonDeleteTapped(){
        let alert = UIAlertController(title: "Caution!", message: "Are you sure to delete this Contact", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action: UIAlertAction!) in
            if let unwarppedName =  self.displayScreen.labelName.text {
                let text = "DELETE" + "," + unwarppedName
                self.notificationCenter.post(
                                name: Notification.Name("orderFromDetailScreen"),
                                object: text)
            }
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        self.present(alert, animated: true)
        
    }

}
