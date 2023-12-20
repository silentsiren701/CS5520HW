//
//  AddRewardView.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import UIKit

class AddRewardView: UIView {
    var titleBlock: UITextField!
    var pointSlider: UISlider!
    var descriptionBlock: UITextView!
    
    var titleDescripLabel: UILabel!
    var pointSliderLabel: UILabel!
    var descriptionBlockLabel: UILabel!
    
    var labelPhoto:UILabel!
    var buttonTakePhoto: UIButton!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setdescriptionBlock()
        setpointSlider()
        setdtitleBlock()
        
        
        settitleDescripLabel()
        setpointSliderLabel()
        setdescriptionBlockLabel()
        
        setuplabelPhoto()
        setupbuttonTakePhoto()
        
        initConstraints()
    }
    
// MARK: - Label UI
    func settitleDescripLabel() {
        titleDescripLabel = UILabel()
        
        titleDescripLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleDescripLabel.text = "Reward Title"

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
        pointSlider.maximumValue = 10
        pointSlider.isContinuous = false
        pointSlider.tintColor = UIColor.darkGray
        pointSlider.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(pointSlider)
    }
    
    func setuplabelPhoto(){
        labelPhoto = UILabel()
        labelPhoto.text = "Add Reward Photo"
        labelPhoto.font = UIFont.boldSystemFont(ofSize: 14)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
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
            
            buttonTakePhoto.topAnchor.constraint(equalTo: descriptionBlock.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            //MARK: setting buttonTakePhoto's height and width..
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
