//
//  QuestTableViewCell.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/7/23.
//

import UIKit

class QuestTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var titleCell: UILabel!
    var rewardPtsCell: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        
        setuptitleCell()
        setuprewardPtsCEll()
        
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.layer.cornerRadius = 10
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setuptitleCell(){
        titleCell = UILabel()
        titleCell.font = UIFont.boldSystemFont(ofSize: 14)
        titleCell.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(titleCell)
    }

    
    func setuprewardPtsCEll(){
        rewardPtsCell = UILabel()
        rewardPtsCell.font = UIFont.boldSystemFont(ofSize: 14)
        rewardPtsCell.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(rewardPtsCell)
    }


    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            rewardPtsCell.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -12),
            rewardPtsCell.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            
            titleCell.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 12),
            titleCell.trailingAnchor.constraint(equalTo: rewardPtsCell.leadingAnchor, constant: -12),
            titleCell.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
