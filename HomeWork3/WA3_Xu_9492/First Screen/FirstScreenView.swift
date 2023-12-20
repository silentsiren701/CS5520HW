//
//  FirstScreenView.swift
//  WA3_Xu_9492
//
//  Created by Aiden Hsu on 9/29/23.
//

import UIKit

class FirstScreenView: UIView {

    var titleLabel: UILabel!;
    var nameField: UITextField!;
    var emailField: UITextField!;
    var phoneType1Label: UILabel!;
    var phoneType2Label: UILabel!;
    var phoneTypePicker: UIPickerView!;
    var phoneNumberField: UITextField!;
    var addressField: UITextField!;
    var cityAndStateField: UITextField!;
    var zipField: UITextField!;
    var submitButton: UIButton!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setTitleLabel()
        setNameField()
        setEmailField()
        setPhoneType1Label()
        setPhoneType2Label()
        setPhoneTypePicker()
        setPhoneNumberField()
        setAddressField()
        setCityAndStateField()
        setzipField()
        setSubmitButton()
        
        initConstraints()
        
    }
    
    func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Create Profile"
        titleLabel.font = UIFont.systemFont(ofSize: 28);
        titleLabel.textAlignment = .center;
        titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(titleLabel)
    }
    
    func setNameField() {
        nameField = UITextField()
        nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(nameField)
    }
    
    func setEmailField() {
        emailField = UITextField();
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(emailField)
    }
    
    func setPhoneType1Label() {
        phoneType1Label = UILabel();
        phoneType1Label.text = "Add Phone"
        phoneType1Label.font = UIFont.systemFont(ofSize: 24);
        phoneType1Label.textAlignment = .center;
        phoneType1Label.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(phoneType1Label)
    }
    
    func setPhoneType2Label() {
        phoneType2Label = UILabel();
        phoneType2Label.text = "Select Type:"
        phoneType2Label.textAlignment = .center;
        phoneType2Label.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(phoneType2Label)
    }
    
    func setPhoneTypePicker() {
        phoneTypePicker = UIPickerView();
        phoneTypePicker.isUserInteractionEnabled = true
        phoneTypePicker.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(phoneTypePicker)
    }
    
    func setPhoneNumberField() {
        phoneNumberField = UITextField();
        phoneNumberField.placeholder = "Phone number";
        phoneNumberField.borderStyle = .roundedRect
        phoneNumberField.keyboardType = .phonePad
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(phoneNumberField)
    }
    
    func setAddressField() {
        addressField = UITextField();
        addressField.placeholder = "Address"
        addressField.borderStyle = .roundedRect
        addressField.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(addressField)
    }
    
    func setCityAndStateField() {
        cityAndStateField = UITextField()
        cityAndStateField.placeholder = "City, State"
        cityAndStateField.borderStyle = .roundedRect
        cityAndStateField.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(cityAndStateField)
    }
    
    func setzipField() {
        zipField = UITextField();
        zipField.placeholder = "ZIP"
        zipField.borderStyle = .roundedRect
        zipField.keyboardType = .phonePad
        zipField.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(zipField)
    }
    
    func setSubmitButton() {
        submitButton = UIButton(type: .system)
        submitButton.setTitle("Show Profile", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(submitButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            nameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            nameField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            nameField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 12),
            emailField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            emailField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            phoneType1Label.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 12),
            phoneType1Label.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            phoneType1Label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneType1Label.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            phoneType2Label.topAnchor.constraint(equalTo: phoneType1Label.bottomAnchor, constant: 12),
            phoneType2Label.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            phoneType2Label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneType2Label.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            phoneTypePicker.topAnchor.constraint(equalTo: phoneType2Label.bottomAnchor, constant: 12),
            phoneTypePicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            phoneTypePicker.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneTypePicker.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            phoneTypePicker.heightAnchor.constraint(equalToConstant: 150),
            
            phoneNumberField.topAnchor.constraint(equalTo: phoneTypePicker.bottomAnchor, constant: 12),
            phoneNumberField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            phoneNumberField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneNumberField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            addressField.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 12),
            addressField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            addressField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            addressField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            cityAndStateField.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: 12),
            cityAndStateField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            cityAndStateField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cityAndStateField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            zipField.topAnchor.constraint(equalTo: cityAndStateField.bottomAnchor, constant: 12),
            zipField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            zipField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            zipField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            submitButton.topAnchor.constraint(equalTo: zipField.bottomAnchor, constant: 24),
            submitButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            submitButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
