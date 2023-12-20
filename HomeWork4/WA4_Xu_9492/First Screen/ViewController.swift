//
//  ViewController.swift
//  WA4_Xu_9492
//
//  Created by Aiden Hsu on 10/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    var ContactsList = [Contacts]()
    
    let firstScreen = FirstScreenView()
    
    override func loadView() {
        view = firstScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "My Contacts"
        
        //MARK: patching the table view delegate and datasource to controller...
        firstScreen.tableViewContacts.delegate = self
        firstScreen.tableViewContacts.dataSource = self
        
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }

    @objc func onAddBarButtonTapped(){
        let addContactController = AddContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
    
    //MARK: got the new expense back and delegated to ViewController...
    func delegateOnAddContact(Contact: Contacts){
        ContactsList.append(Contact)
        firstScreen.tableViewContacts.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactsList.count
    }
    
    //MARK: populate a cell for the currecnt row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsList", for: indexPath) as! TableViewContactsCell
        cell.labelNameTitle.text = ContactsList[indexPath.row].name
        cell.labelEmail.text = ContactsList[indexPath.row].email
        cell.labelPhone.text = ContactsList[indexPath.row].phoneType! + " (" + ContactsList[indexPath.row].phoneType! + ")"
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailScreenController = ContactDetailViewController()
        contactDetailScreenController.receivedContacts = self.ContactsList[indexPath.row]
        navigationController?.pushViewController(contactDetailScreenController, animated: true)
    }
    
}
