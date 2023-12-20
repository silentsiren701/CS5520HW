//
//  NoteTableViewCell.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/4/23.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var textBlock:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setuptextBlock()
        
        initConstraints()
    }

    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
    
        wrapperCellView.backgroundColor = .white
//        wrapperCellView.layer.cornerRadius = 4.0
//        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
//        wrapperCellView.layer.shadowOffset = .zero
//        wrapperCellView.layer.shadowRadius = 2.0
//        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setuptextBlock(){
        textBlock = UILabel()
        
//        textBlock.font = UIFont.systemFont(ofSize: 16)
//        textBlock.textColor = UIColor.black
//        textBlock.textAlignment = .natural
        textBlock.numberOfLines = 1
        textBlock.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(textBlock)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            textBlock.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            textBlock.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 30),
            textBlock.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -50),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 36),
            
        ])
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

