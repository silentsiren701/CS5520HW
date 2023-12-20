//
//  QuestBottomSheetView.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/7/23.
//

import UIKit

class QuestBottomSheetView: UIView {

    var titleBlock: UILabel!
    var pointBlock: UILabel!
    var descriptionBlock: UITextView!
    
    var deleteButton: UIButton!
    var finishButton: UIButton!
    var EditButton: UIButton!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setdescriptionBlock()
        setpointSlider()
        setdtitleBlock()
        
        setdeleteButton()
        setEditButton()
        setfinishButton()
        
        initConstraints()
    }

// MARK: - Input Values UI
    func setdtitleBlock() {
        titleBlock = UILabel()

        titleBlock.font = UIFont.boldSystemFont(ofSize: 24) // Set the desired font size

        titleBlock.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleBlock)
    }
    
    func setpointSlider() {
        pointBlock = UILabel()

        pointBlock.font = UIFont.boldSystemFont(ofSize: 12) // Set the desired font size

        pointBlock.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(pointBlock)
    }
    
    
    func setdescriptionBlock() {
        descriptionBlock = UITextView()
        
        descriptionBlock.isEditable = false
        descriptionBlock.font = .systemFont(ofSize: 20)
        
        descriptionBlock.layer.cornerRadius = 5
        descriptionBlock.layer.borderWidth = 0.5
        descriptionBlock.clipsToBounds = true
        
        descriptionBlock.translatesAutoresizingMaskIntoConstraints = false
        // Additional configurations...
        
        self.addSubview(descriptionBlock)
    }
    
    func setdeleteButton() {
        deleteButton = UIButton()
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        deleteButton.configuration = .gray()
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(deleteButton)

    }


    func setfinishButton() {
        finishButton = UIButton()
        finishButton.setTitle("Finish", for: .normal)
        finishButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        finishButton.configuration = .filled()
        
        finishButton.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(finishButton)

    }
    
    func setEditButton() {
        EditButton = UIButton()
        EditButton.setTitle("Edit", for: .normal)
        EditButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        EditButton.configuration = .filled()
        
        EditButton.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(EditButton)

    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            // MARK: - button position
            finishButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            finishButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            deleteButton.centerYAnchor.constraint(equalTo: finishButton.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: finishButton.leadingAnchor, constant: -20),
            
            EditButton.centerYAnchor.constraint(equalTo: finishButton.centerYAnchor),
            EditButton.leadingAnchor.constraint(equalTo: finishButton.trailingAnchor, constant: 20),
            
            // MARK: - Other position
            titleBlock.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleBlock.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            pointBlock.topAnchor.constraint(equalTo: titleBlock.bottomAnchor, constant: 12),
            pointBlock.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            descriptionBlock.topAnchor.constraint(equalTo: pointBlock.bottomAnchor, constant: 12),
            descriptionBlock.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionBlock.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionBlock.bottomAnchor.constraint(equalTo: finishButton.topAnchor, constant: -20)
            
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
