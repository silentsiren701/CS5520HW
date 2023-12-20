//
//  QuestViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import NotificationCenter

class QuestViewController: UIViewController {
    var currentUser: User?
    var questList: [Quest] = []
    
    let notificationCenter = NotificationCenter.default
    let db = Firestore.firestore()
    let questView = QuestView()
        
    override func loadView() {
        view = questView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUserLoadObserver()
        setUserListener()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Quests"
        
        questView.tableViewQuests.dataSource = self
        questView.tableViewQuests.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewQuest))
    }
    
    
    @objc func addNewQuest() {
        let AddNewQuestPage = AddQuestViewController()
        AddNewQuestPage.currentUser = currentUser
        self.navigationController?.pushViewController(AddNewQuestPage, animated: true)
    }
    
    func setUserData() {
        if let user = currentUser {
            questView.labelText.text = "Welcome \(user.name), you have \(user.totalPts) Pts."
        } else {
            print("User has not been loggin")
        }
    }
}



extension QuestViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestReuseIdentifier", for: indexPath) as! QuestTableViewCell
        let Quest = questList[indexPath.row]
        
        cell.titleCell.text = Quest.title
        cell.rewardPtsCell.text = "\(Quest.rewardPts)Pts"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bottomSheet = QuestBottomSheetViewController()
        bottomSheet.myQuest = questList[indexPath.row]
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
