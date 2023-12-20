//
//  QuestView.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import UIKit

class QuestView: UIView {

    var labelText: UILabel!
    var tableViewQuests: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupLabelText()
        setupTableViewQuests()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupTableViewQuests(){
        tableViewQuests = UITableView()
        tableViewQuests.register(QuestTableViewCell.self, forCellReuseIdentifier: "QuestReuseIdentifier")
        
        tableViewQuests.layer.borderWidth = 0.5
        tableViewQuests.layer.cornerRadius = 5
        
        tableViewQuests.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewQuests)
    }
    
    
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            labelText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            tableViewQuests.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 8),
            tableViewQuests.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewQuests.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewQuests.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
