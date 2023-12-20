//
//  RewardBottomSheetViewButtonTappedManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import Foundation

extension RewardBottomSheetViewController {
    @objc func onDeleteButtonTapped() {
        deleteReward()
        dismiss(animated: true)
    }
    
    @objc func onFinishButtonTapped() {
        if let user = currentUser {
            if user.totalPts >= myReward!.rewardPts {
                finishReward()
                dismiss(animated: true)
            } else {
                
            }
        } else {
            print("User has not been logged in")
        }
        
    }
    
    @objc func onEditButtonTapped() {
        let editRewardPage = EditRewardViewController()
        editRewardPage.currentUser = currentUser
        editRewardPage.myReward = myReward
        
        self.notificationCenter.addObserver(
            self, selector: #selector(editFinish(notification:)),
            name: .RewardEdited,
            object: nil)
        
        self.navigationController?.pushViewController(editRewardPage, animated: true)
    }
    
    @objc func editFinish(notification:Notification) {
        dismiss(animated: true)
    }
}
