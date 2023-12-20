//
//  NotesCreateView.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/5/23.
//

import UIKit

class NotesCreateView: UIView {
    var textBox: UITextView!
    var submitButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setSubmitButton()
        setTextBox()
        
        initConstraints()
    }
    
    func setTextBox() {
        textBox = UITextView()
        textBox.font = .systemFont(ofSize: 18)
        textBox.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textBox)
    }
    
    func setSubmitButton() {
        submitButton = UIButton(type: .system)
        submitButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.configuration = .filled()
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(submitButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            submitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant:  -8),
            submitButton.widthAnchor.constraint(equalToConstant: 120),
            submitButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textBox.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            textBox.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textBox.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textBox.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -16),
        
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
