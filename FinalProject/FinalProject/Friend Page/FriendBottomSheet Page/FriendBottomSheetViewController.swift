//
//  FriendBottomSheetViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/12/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class FriendBottomSheetViewController: UIViewController {
    var currentUser: User?
    var myFriend: Friend?

    let db = Firestore.firestore()
    let notificationCenter = NotificationCenter.default
    let friendBottomSheetPage = FriendBottomSheetView()
        
    override func loadView() {
        view = friendBottomSheetPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpFriend()
        
        friendBottomSheetPage.deleteButton.addTarget(self, action: #selector(onDeleteButtonTapped), for: .touchUpInside)
        friendBottomSheetPage.finishButton.addTarget(self, action: #selector(onGiftButtonTapped), for: .touchUpInside)
//        friendBottomSheetPage.EditButton.addTarget(self, action: #selector(onEditButtonTapped), for: .touchUpInside)
        
    }
    
    func setUpFriend() {
        if let thisFriend = myFriend {
            friendBottomSheetPage.titleBlock.text = thisFriend.email
//            friendBottomSheetPage.pointBlock.text = "\(thisFriend.rewardPts)Pts"
//            friendBottomSheetPage.descriptionBlock.text = thisFriend.description
        }
    }


}

