//
//  TableViewContactsCell.swift
//  WA4_Xu_9492
//
//  Created by Aiden Hsu on 10/6/23.
//

import UIKit

class TableViewContactsCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelNameTitle: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelNameTitle()
        setupLabelEmail()
        setupLabelPhone()
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 1
        wrapperCellView.layer.cornerRadius = 10
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelNameTitle(){
        labelNameTitle = UILabel()
        labelNameTitle.font = UIFont.boldSystemFont(ofSize: 16)
        labelNameTitle.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelNameTitle)
    }
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.font = UIFont.systemFont(ofSize: 14)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.font = UIFont.systemFont(ofSize: 14)
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhone)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelNameTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            labelNameTitle.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
            labelNameTitle.heightAnchor.constraint(equalToConstant: 24),
            
            labelEmail.topAnchor.constraint(equalTo: labelNameTitle.bottomAnchor, constant: 4),
            labelEmail.leadingAnchor.constraint(equalTo: labelNameTitle.leadingAnchor),
            labelEmail.heightAnchor.constraint(equalToConstant: 18),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
            labelPhone.leadingAnchor.constraint(equalTo: labelNameTitle.leadingAnchor),
            labelPhone.heightAnchor.constraint(equalToConstant: 18),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}
