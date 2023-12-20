//
//  FriendViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import NotificationCenter

class FriendViewController: UIViewController {
    var currentUser: User?
    var friendList: [Friend] = []
    
    let notificationCenter = NotificationCenter.default
    let db = Firestore.firestore()
    let friendView = FriendView()
        
    override func loadView() {
        view = friendView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUserLoadObserver()
        setUserListener()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Friends"
        
        friendView.tableViewFriends.dataSource = self
        friendView.tableViewFriends.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewFriend))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutUser))
    }
    
    
    @objc func addNewFriend() {
        let AddNewFriendPage = AddFriendViewController()
        AddNewFriendPage.currentUser = currentUser
        self.navigationController?.pushViewController(AddNewFriendPage, animated: true)
    }
    
    @objc func logoutUser() {
        //        db.collection("users")
        //            .document("bobjones1@gmail.com")
        //            .updateData([
        //                "totalPts": currentUser!.totalPts + 12
        //        ]) { err in
        //          if let err = err {
        //            print("Error updating document: \(err)")
        //          } else {
        //            print("user score incremented!")
        //          }
        //        }
        
        
        do {
            try FirebaseAuth.Auth.auth().signOut()
    
    
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            // Handle error, maybe show an alert to the user
        }
    }
    
    
    func setUserData() {
        if let user = currentUser {
            friendView.labelText.text = "Welcome \(user.name), you have \(user.totalPts) Pts."
        } else {
            print("User has not been loggin")
        }
        
    }
}



extension FriendViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendReuseIdentifier", for: indexPath) as! FriendTableViewCell
        let Friend = friendList[indexPath.row]
        
        cell.titleCell.text = Friend.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bottomSheet = FriendBottomSheetViewController()
        bottomSheet.myFriend = friendList[indexPath.row]
        bottomSheet.currentUser = currentUser
        
        let bottomSheetNavController = UINavigationController(rootViewController: bottomSheet)
                
        // MARK: setting up modal style...
        bottomSheetNavController.modalPresentationStyle = .pageSheet
        
        if let bottomPresentSheet = bottomSheetNavController.sheetPresentationController{
            bottomPresentSheet.detents = [.medium(), .large()]
            bottomPresentSheet.prefersGrabberVisible = true
        }
        
        present(bottomSheetNavController, animated: true)
    }
}
