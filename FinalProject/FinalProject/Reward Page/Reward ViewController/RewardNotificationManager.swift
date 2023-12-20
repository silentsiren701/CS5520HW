//
//  RewardNotificationManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import Foundation
import NotificationCenter

extension Notification.Name{
    static let RewardUserLoad = Notification.Name("RewardUserLoad")
    static let RewardsLoad = Notification.Name("RewardsLoad")
    static let RewardEdited = Notification.Name("RewardEditted")
}

extension RewardViewController {
    // MARK: - set User
    func setUserLoadObserver() {
        self.notificationCenter.addObserver(
            self, selector: #selector(userLoadFinish(notification:)),
            name: .RewardUserLoad,
            object: nil)
    }
    
    @objc func userLoadFinish(notification: Notification) {
        // When we finished load User
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { //Tries to load too fast and crashes without this
            self.setUserData()
            
            self.setRewardsLoadObserver()
            self.setRewardListener()
        }
    }
    
    // MARK: - set Rewards
    func setRewardsLoadObserver() {
        self.notificationCenter.addObserver(
            self, selector: #selector(RewardsLoadFinish(notification:)),
            name: .RewardsLoad,
            object: nil)
    }
    
    @objc func RewardsLoadFinish(notification: Notification) {
        // When we finished load User
        self.rewardView.tableViewRewards.reloadData()
    }
}
