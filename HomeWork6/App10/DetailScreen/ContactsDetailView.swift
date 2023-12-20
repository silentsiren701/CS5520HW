//
//  ContactDetailView.swift
//  WA4_Xu_9492
//
//  Created by Aiden Hsu on 10/6/23.
//


import UIKit

class ContactsDetailView: UIView {
    // MARK: Informations
    var contentWrapper: UIScrollView!
    
    var labelName: UILabel!;
    var labelEmail: UILabel!;
    var labelPhone: UILabel!;
    
    var labelNameTitle: UILabel!;
    var labelEmailTitle: UILabel!;
    var labelPhoneTitle: UILabel!;
    
    // Buttons
    var ButtonDelete: UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        setupContentWrapper()
        
        setLabelNameTitle()
        setLabelEmailTitle()
        setLabelPhoneTitle()
        
        setLabelName()
        setLabelEmail()
        setLabelPhone()
        

        setButtonDelete()
        
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
    
    
    func setLabelName() {
        labelName = UILabel()
        labelName.font = UIFont.systemFont(ofSize: 20);
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelName)
    }
    
    func setLabelEmail() {
        labelEmail = UILabel()
        labelEmail.font = UIFont.systemFont(ofSize: 20);
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmail)
    }
    
    func setLabelPhone() {
        labelPhone = UILabel()
        labelPhone.font = UIFont.systemFont(ofSize: 20);
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPhone)
    }
    
    func setButtonDelete() {
        ButtonDelete = UIButton(type: .system)
        ButtonDelete.titleLabel?.font = .boldSystemFont(ofSize: 20)
        ButtonDelete.setTitle("Delete", for: .normal)
        ButtonDelete.setTitleColor(.red, for: .normal);
        ButtonDelete.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(ButtonDelete)
    }
    
    func initConstraints () {
        let contentLayoutGuide = contentWrapper.contentLayoutGuide
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            labelNameTitle.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 36),
            labelNameTitle.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            labelNameTitle.widthAnchor.constraint(equalToConstant: 80),
            
            labelName.centerYAnchor.constraint(equalTo: labelNameTitle.centerYAnchor),
            labelName.leadingAnchor.constraint(equalTo: labelNameTitle.trailingAnchor),
            labelName.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            labelEmailTitle.topAnchor.constraint(equalTo: labelNameTitle.bottomAnchor, constant: 16),
            labelEmailTitle.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            labelEmailTitle.widthAnchor.constraint(equalToConstant: 80),
            
            labelEmail.centerYAnchor.constraint(equalTo: labelEmailTitle.centerYAnchor),
            labelEmail.leadingAnchor.constraint(equalTo: labelEmailTitle.trailingAnchor),
            labelEmail.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            labelPhoneTitle.topAnchor.constraint(equalTo: labelEmailTitle.bottomAnchor, constant: 16),
            labelPhoneTitle.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            labelPhoneTitle.widthAnchor.constraint(equalToConstant: 80),
            
            labelPhone.centerYAnchor.constraint(equalTo: labelPhoneTitle.centerYAnchor),
            labelPhone.leadingAnchor.constraint(equalTo: labelPhoneTitle.trailingAnchor),
            labelPhone.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: 16),
            
            ButtonDelete.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
            ButtonDelete.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            contentLayoutGuide.bottomAnchor.constraint(equalTo: ButtonDelete.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
