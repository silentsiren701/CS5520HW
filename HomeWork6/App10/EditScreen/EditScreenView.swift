//
//  EditScreenView.swift
//  App10
//
//  Created by Aiden Hsu on 10/27/23.
//

import UIKit

class EditScreenView: UIView {
    // MARK: Informations
    var contentWrapper: UIScrollView!
    
    var labelNameTitle: UILabel!;
    var labelEmailTitle: UILabel!;
    var labelPhoneTitle: UILabel!;
    
    var fieldName: UITextField!;
    var fieldEmail: UITextField!;
    var fieldPhone: UITextField!;
    
    // Buttons
    var ButtonSave: UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        setupContentWrapper()
        
        setLabelNameTitle()
        setLabelEmailTitle()
        setLabelPhoneTitle()
        
        setFieldName()
        setFieldEmail()
        setFieldPhone()
        setButtonSave()
        
        initConstraints()
    }
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setLabelNameTitle() {
        labelNameTitle = UILabel()
        labelNameTitle.text = "Name: ";
        labelNameTitle.font = UIFont.boldSystemFont(ofSize: 20);
        labelNameTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelNameTitle)
    }
    
    func setLabelEmailTitle() {
        labelEmailTitle = UILabel()
        labelEmailTitle.text = "Email: ";
        labelEmailTitle.font = UIFont.boldSystemFont(ofSize: 20);
        labelEmailTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmailTitle)
    }
    
    func setLabelPhoneTitle() {
        labelPhoneTitle = UILabel()
        labelPhoneTitle.text = "Phone: ";
        labelPhoneTitle.font = UIFont.boldSystemFont(ofSize: 20);
        labelPhoneTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPhoneTitle)
    }
    
    func setFieldName() {
        fieldName = UITextField()
        fieldName.font = UIFont.systemFont(ofSize: 20);
        fieldName.borderStyle = .roundedRect
        fieldName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(fieldName)
    }
    
    func setFieldEmail() {
        fieldEmail = UITextField()
        fieldEmail.font = UIFont.systemFont(ofSize: 20);
        fieldEmail.borderStyle = .roundedRect
        fieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(fieldEmail)
    }
    
    func setFieldPhone() {
        fieldPhone = UITextField()
        fieldPhone.font = UIFont.systemFont(ofSize: 20);
        fieldPhone.borderStyle = .roundedRect
        fieldPhone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(fieldPhone)
    }
    
    func setButtonSave() {
        ButtonSave = UIButton(type: .system)
        ButtonSave.titleLabel?.font = .boldSystemFont(ofSize: 20)
        ButtonSave.setTitle("Save", for: .normal)
        ButtonSave.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(ButtonSave)
    }

    
    func initConstraints () {
        let contentLayoutGuide = contentWrapper.contentLayoutGuide
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            labelNameTitle.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 36),
            labelNameTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelNameTitle.widthAnchor.constraint(equalToConstant: 80),
            
            fieldName.centerYAnchor.constraint(equalTo: labelNameTitle.centerYAnchor),
            fieldName.leadingAnchor.constraint(equalTo: labelNameTitle.trailingAnchor),
            fieldName.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            labelEmailTitle.topAnchor.constraint(equalTo: labelNameTitle.bottomAnchor, constant: 16),
            labelEmailTitle.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            labelEmailTitle.widthAnchor.constraint(equalToConstant: 80),
            
            fieldEmail.centerYAnchor.constraint(equalTo: labelEmailTitle.centerYAnchor),
            fieldEmail.leadingAnchor.constraint(equalTo: labelEmailTitle.trailingAnchor),
            fieldEmail.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            labelPhoneTitle.topAnchor.constraint(equalTo: labelEmailTitle.bottomAnchor, constant: 16),
            labelPhoneTitle.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            labelPhoneTitle.widthAnchor.constraint(equalToConstant: 80),
            
            fieldPhone.centerYAnchor.constraint(equalTo: labelPhoneTitle.centerYAnchor),
            fieldPhone.leadingAnchor.constraint(equalTo: labelPhoneTitle.trailingAnchor),
            fieldPhone.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            ButtonSave.topAnchor.constraint(equalTo: fieldPhone.bottomAnchor, constant: 16),
            ButtonSave.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            contentLayoutGuide.bottomAnchor.constraint(equalTo: ButtonSave.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
