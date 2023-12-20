//
//  ViewController.swift
//  App10
//
//  Created by Sakib Miazi on 5/25/23.
//


import UIKit
import FirebaseAuth

class ViewController: UITabBarController, UITabBarControllerDelegate {
    var handleAuth: AuthStateDidChangeListenerHandle?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        // MARK: Check if we have logged in...
        manageAuth()
        
        //MARK: setting up Quest Tab Bar..
        let tabQuest = UINavigationController(rootViewController: QuestViewController())
        let tabRedBarItem = UITabBarItem(
            title: "Quest",
            image: UIImage(systemName: "checkmark.square")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.gray),
            selectedImage: UIImage(systemName: "checkmark.square.fill")
        )
        tabQuest.tabBarItem = tabRedBarItem
        tabQuest.title = "Quest"

        
        //MARK: setting up Reward tab bar...
        let tabReward = UINavigationController(rootViewController: RewardViewController())
        let tabGreenBarItem = UITabBarItem(
            title: "Reward",
            image: UIImage(systemName: "target")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "target")?.withTintColor(UIColor.blue)
        )
        tabReward.tabBarItem = tabGreenBarItem


        
        //MARK: setting up Friend tab bar...
        let tabFriend = UINavigationController(rootViewController: FriendViewController())
        let tabBlueBarItem = UITabBarItem(
            title: "Friend",
            image: UIImage(systemName: "person.2.wave.2")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "person.2.wave.2.fill")
        )
        tabFriend.tabBarItem = tabBlueBarItem
   
   
        
        //MARK: setting up this view controller as the Tab Bar Controller...
        self.viewControllers = [tabQuest, tabReward, tabFriend]

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
