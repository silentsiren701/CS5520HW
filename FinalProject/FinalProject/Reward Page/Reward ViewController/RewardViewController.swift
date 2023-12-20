//
//  RewardViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import NotificationCenter

class RewardViewController: UIViewController {
    var currentUser: User?
    var rewardList: [Reward] = []
    
    let notificationCenter = NotificationCenter.default
    let db = Firestore.firestore()
    let rewardView = RewardView()
        
    override func loadView() {
        view = rewardView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUserLoadObserver()
        setUserListener()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Rewards"
        
        rewardView.tableViewRewards.dataSource = self
        rewardView.tableViewRewards.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewReward))
    }
    
    
    @objc func addNewReward() {
        let AddNewRewardPage = AddRewardViewController()
        AddNewRewardPage.currentUser = currentUser
        self.navigationController?.pushViewController(AddNewRewardPage, animated: true)
    }
    
    func setUserData() {
        if let user = currentUser {
            rewardView.labelText.text = "Welcome \(user.name), you have \(user.totalPts) Pts."
        } else {
            print("User has not been loggin")
        }
        
    }
}



extension RewardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rewardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RewardReuseIdentifier", for: indexPath) as! RewardTableViewCell
        let Reward = rewardList[indexPath.row]
        
        cell.titleCell.text = Reward.title
        cell.rewardPtsCell.text = "\(Reward.rewardPts)Pts"
        cell.rewardPic.loadRemoteImage(from: Reward.photoURL)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bottomSheet = RewardBottomSheetViewController()
        bottomSheet.myReward = rewardList[indexPath.row]
        bottomSheet.currentUser = currentUser
        
        let bottomSheetNavController = UINavigationController(rootViewController: bottomSheet)
                
        // MARK: setting up modal style...
        bottomSheetNavController.modalPresentationStyle = .pageSheet
        
        if let bottomPresentSheet = bottomSheetNavController.sheetPresentationController{
            bottomPresentSheet.detents = [.large()]
            bottomPresentSheet.prefersGrabberVisible = true
        }
        
        present(bottomSheetNavController, animated: true)
    }
}
