//
//  EditQuestView.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Aiden Hsu on 12/8/23.
//

import UIKit

class EditQuestView: UIView {

    var titleBlock: UITextField!
    var pointSlider: UISlider!
    var descriptionBlock: UITextView!
    
    var titleDescripLabel: UILabel!
    var pointSliderLabel: UILabel!
    var descriptionBlockLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setdescriptionBlock()
        setpointSlider()
        setdtitleBlock()
        
        
        settitleDescripLabel()
        setpointSliderLabel()
        setdescriptionBlockLabel()
        
        initConstraints()
    }
    
// MARK: - Label UI
    func settitleDescripLabel() {
        titleDescripLabel = UILabel()
        
        titleDescripLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleDescripLabel.text = "Quest Title"

        titleDescripLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleDescripLabel)
    }

    func setpointSliderLabel() {
        pointSliderLabel = UILabel()

        pointSliderLabel.font = UIFont.boldSystemFont(ofSize: 16) // Set the desired font size
        pointSliderLabel.text = "Reward Points" // Set the label text

        pointSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pointSliderLabel)
    }

    func setdescriptionBlockLabel() {
        descriptionBlockLabel = UILabel()

        descriptionBlockLabel.font = UIFont.boldSystemFont(ofSize: 16) // Set the desired font size
        descriptionBlockLabel.text = "Description" // Set the label text

        descriptionBlockLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionBlockLabel)
    }

// MARK: - Input Values UI
    func setdtitleBlock() {
        titleBlock = UITextField()
        
        titleBlock.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        titleBlock.layer.cornerRadius = 5
        titleBlock.layer.borderWidth = 0.5
        titleBlock.clipsToBounds = true
        titleBlock.font = .systemFont(ofSize: 20)
        
        titleBlock.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleBlock)
    }
    
    
    func setdescriptionBlock() {
        descriptionBlock = UITextView()
        
        descriptionBlock.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        descriptionBlock.layer.cornerRadius = 5
        descriptionBlock.layer.borderWidth = 0.5
        descriptionBlock.clipsToBounds = true
        descriptionBlock.font = .systemFont(ofSize: 16)
        
        descriptionBlock.translatesAutoresizingMaskIntoConstraints = false
        // Additional configurations...
        
        self.addSubview(descriptionBlock)
    }
    
    func setpointSlider() {
        pointSlider = UISlider()
        
        pointSlider.value = 1
        pointSlider.minimumValue = 1
        pointSlider.maximumValue = 5
        pointSlider.isContinuous = false
        pointSlider.tintColor = UIColor.darkGray
        pointSlider.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(pointSlider)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            titleDescripLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleDescripLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            titleBlock.topAnchor.constraint(equalTo: titleDescripLabel.bottomAnchor, constant: 12),
            titleBlock.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleBlock.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            pointSliderLabel.topAnchor.constraint(equalTo:titleBlock.bottomAnchor, constant: 20),
            pointSliderLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            pointSlider.topAnchor.constraint(equalTo: pointSliderLabel.bottomAnchor, constant: 12),
            pointSlider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pointSlider.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            descriptionBlockLabel.topAnchor.constraint(equalTo:pointSlider.bottomAnchor, constant: 20),
            descriptionBlockLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            descriptionBlock.topAnchor.constraint(equalTo: descriptionBlockLabel.bottomAnchor, constant: 12),
            descriptionBlock.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionBlock.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionBlock.heightAnchor.constraint(equalToConstant: 200),  // Set your desired height
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
