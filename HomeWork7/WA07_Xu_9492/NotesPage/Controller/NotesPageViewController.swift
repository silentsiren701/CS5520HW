//
//  NotesPageViewController.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/2/23.
//

import UIKit

class NotesPageViewController: UIViewController {
    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let notesPage = NotesPageView()
    
    //MARK: list to display the notes in the TableView...
    var notesFolder = [Note]()
    
    override func loadView() {
        view = notesPage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mark set up the top bar
        navigationItem.hidesBackButton = true
        title = "Expense App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    
        //MARK:token: intheDeafute setting the delegate and data source...
        notesPage.NotesTableView.dataSource = self
        notesPage.NotesTableView.delegate = self

        // MARK: get all notes
        updateAllCells()
        
        //MARK: add action to ButtonDelete and loginButton
        notesPage.logoutButton.addTarget(self, action: #selector(onnotesPageTapped), for: .touchUpInside)
        
        notesPage.profileButton.addTarget(self, action: #selector(onprofileButtonTapped), for: .touchUpInside)

    }
    
    // MARK: This function will give AddBarButton functionality, let it push a add page then wait for result
    @objc func onAddBarButtonTapped() {
        notificationCenter.addObserver(
            self,
            selector: #selector(NotificationAddCells(notification:)),
            name:.posted,
            object: nil)
        
        let notesCreatePage = NotesCreateViewController()
        navigationController?.pushViewController(notesCreatePage, animated: true)
    }
    
    @objc func onprofileButtonTapped() {
        let ProfilePage = ProfileViewController()
        navigationController?.pushViewController(ProfilePage, animated: true)
    }
    
    // MARK: This function updates values in notesFolder, Then refreash the table view
    @objc func updateAllCells () {
        if let token = getToken() {
            notificationCenter.addObserver(
                self,
                selector: #selector(setNotes(notification:)),
                name:.notesRecieved,
                object: nil)
            
            getall(token: token)
            
        }
    }
    
    // MARK: Notification call for updateAllCells,
    func initializeFolder () {
        notesFolder.removeAll()
    }
    
    // MARK: Notification call for updateAllCells
    @objc func NotificationAddCells (notification: Notification) {
        updateAllCells()
    }
    
    @objc func NotificationDeleteCells (notification: Notification) {
        updateAllCells()
    }
    
    // MARK: Give functionbility to registerButton, let it reset the token then back to the login page
    @objc func onnotesPageTapped() {
        if let token = getToken() {
            logout(token: token)
            print("Logged Out")
            
        }
        
        defaults.removeObject(forKey: "AuthToken")
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: When updateAllCells get all data, this function sets values in notesFolder, then refresh
    @objc func setNotes(notification: Notification) {
        initializeFolder()
        if let notes = notification.object as! Notes? {
            for note in notes.notes {
                notesFolder.append(note)
            }
            notesPage.NotesTableView.reloadData()
        }
    }
    
    
    @objc func getToken() -> String? {
        return defaults.object(forKey: "AuthToken") as! String?
    }

}

extension NotesPageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesFolder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteTableViewCell
        cell.textBlock.text = notesFolder[indexPath.row].text
        
        //MARK: crating an accessory button...
        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        //MARK: setting an icon from sf symbols...
        buttonOptions.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        
        //MARK: setting up menu for button options click...
        buttonOptions.menu = UIMenu(title: "View/Edit/Delete",
                                    children: [
                                        UIAction(title: "Full Text & Edit",handler: {(_) in
                                            self.notificationCenter.addObserver(
                                                self,
                                                selector: #selector(self.NotificationAddCells(notification:)),
                                                name:.posted,
                                                object: nil)
                                            let editNotePage = EditNoteViewController()
                                            editNotePage.initData(note: self.notesFolder[indexPath.row])
                                            self.navigationController?.pushViewController(editNotePage, animated: true)
                                        }),
                                        UIAction(title: "Delete",handler: {(_) in
                                            
                                            if let token = self.getToken() {
                                                self.notificationCenter.addObserver(
                                                    self,
                                                    selector: #selector(self.NotificationDeleteCells(notification:)),
                                                    name:.deleted,
                                                    object: nil)
                                                
                                                self.delete(token: token, note: self.notesFolder[indexPath.row])
                                                
                                            }
                                        })
                                    ])
        //MARK: setting the button as an accessory of the cell...
        cell.accessoryView = buttonOptions
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteTableViewCell
        print("User touched \(cell.textBlock.text)")
    }
}
