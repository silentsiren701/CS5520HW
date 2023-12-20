//
//  RewardView.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/4/23.
//

import UIKit

class RewardView: UIView {

    var labelText: UILabel!
    var tableViewRewards: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupLabelText()
        setupTableViewRewards()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupTableViewRewards(){
        tableViewRewards = UITableView()
        tableViewRewards.register(RewardTableViewCell.self, forCellReuseIdentifier: "RewardReuseIdentifier")
        
        tableViewRewards.layer.borderWidth = 0.5
        tableViewRewards.layer.cornerRadius = 5
        
        tableViewRewards.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewRewards)
    }
    
    
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            labelText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            tableViewRewards.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 8),
            tableViewRewards.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewRewards.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewRewards.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
