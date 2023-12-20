//
//  RewardBottomSheetViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RewardBottomSheetViewController: UIViewController {
    var currentUser: User?
    var myReward: Reward?

    let db = Firestore.firestore()
    let notificationCenter = NotificationCenter.default
    let rewardBottomSheetPage = RewardBottomSheetView()
        
    override func loadView() {
        view = rewardBottomSheetPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpReward()
        
        rewardBottomSheetPage.deleteButton.addTarget(self, action: #selector(onDeleteButtonTapped), for: .touchUpInside)
        rewardBottomSheetPage.finishButton.addTarget(self, action: #selector(onFinishButtonTapped), for: .touchUpInside)
        rewardBottomSheetPage.EditButton.addTarget(self, action: #selector(onEditButtonTapped), for: .touchUpInside)
        
    }
    
    func setUpReward() {
        if let thisReward = myReward {
            rewardBottomSheetPage.rewardPic.loadRemoteImage(from: thisReward.photoURL)
            rewardBottomSheetPage.titleBlock.text = thisReward.title
            rewardBottomSheetPage.pointBlock.text = "\(thisReward.rewardPts)Pts"
            rewardBottomSheetPage.descriptionBlock.text = thisReward.description
        }
    }


}
