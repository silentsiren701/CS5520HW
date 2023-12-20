//
//  FriendBottomSheetViewButtonTappedManager.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/12/23.
//

import Foundation
//import NotificationCenter

//extension Notification.Name{
//    static let FinishGift = Notification.Name("FinishGift")
//}

extension FriendBottomSheetViewController {
    @objc func onDeleteButtonTapped() {
        deleteFriend()
        dismiss(animated: true)
    }
    
    @objc func onGiftButtonTapped() {
        giftFriend()
        //dismiss(animated: true)
    }
    
    @objc func finishGift() {
        dismiss(animated: true)
    }
}
