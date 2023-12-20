//
//  ViewController.swift
//  WA2_Xu_9492
//
//  Created by Aiden Hsu on 9/22/23.
//

import UIKit

class ViewController: UIViewController {
    // labels
    var lableTilte:UILabel!;
    var labelOperation:UILabel!;
    var labelResult:UILabel!;
    
    var textFirstNumber: UITextField!;
    var textSecondNumber: UITextField!;
    
    var buttonAdd: UIButton!;
    var buttonSubtract: UIButton!;
    var buttonMultiply: UIButton!;
    var buttonDivide: UIButton!;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setlableTilte();
        
        settextFirstNumber();
        settextSecondNumber();
        
        setlabelOperation();
        
        setupButtonPlus();
        setupButtonDivide();
        setupButtonMultiply();
        setupButtonSubtract();
        
        setlabelResult();
        
        
        initConstraints();
    }
    
    // Labels
    func setlableTilte() {
        lableTilte = UILabel();
        lableTilte.text = "Basic Calculator";
        lableTilte.font = UIFont.systemFont(ofSize: 28);
        lableTilte.textAlignment = .center;
        lableTilte.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(lableTilte);
    }
    
    func setlabelOperation() {
        labelOperation = UILabel();
        labelOperation.text = "Operations";
        labelOperation.font = UIFont.systemFont(ofSize: 20);
        labelOperation.textAlignment = .center;
        labelOperation.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(labelOperation);
    }
    
    func setlabelResult() {
        labelResult = UILabel();
        labelResult.text = "Result";
        labelResult.font = UIFont.boldSystemFont(ofSize: 20);
        labelResult.textAlignment = .center;
        labelResult.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(labelResult);
    }
    
    // Texts
    func settextFirstNumber() {
        textFirstNumber = UITextField();
        textFirstNumber.placeholder = "First Number"
        textFirstNumber.borderStyle = .roundedRect
        textFirstNumber.keyboardType = .decimalPad
        textFirstNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFirstNumber)
    }
    
    func settextSecondNumber() {
        textSecondNumber = UITextField();
        textSecondNumber.placeholder = "Second Number"
        textSecondNumber.borderStyle = .roundedRect
        textSecondNumber.keyboardType = .decimalPad
        textSecondNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textSecondNumber)
    }
    
    // Text Feild
    func setupButtonPlus(){
        buttonAdd = UIButton(type: .system) //You need to set the type when you create a Button. We use default system button...
        buttonAdd.setTitle("Plus", for: .normal)
        buttonAdd.tintColor = .systemBlue
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonAdd)
        
        buttonAdd.addTarget(self,
                    action: #selector(onButtonPlus),
                    for: .touchUpInside)
    }
    
    func setupButtonSubtract(){
        buttonSubtract = UIButton(type: .system) //You need to set the type when you create a Button. We use default system button...
        buttonSubtract.setTitle("Subtract", for: .normal)
        buttonSubtract.tintColor = .systemBlue
        buttonSubtract.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSubtract)
        
        buttonSubtract.addTarget(self,
                    action: #selector(onButtonSubtract),
                    for: .touchUpInside)
    }
    
    func setupButtonMultiply(){
        buttonMultiply = UIButton(type: .system) //You need to set the type when you create a Button. We use default system button...
        buttonMultiply.setTitle("Multiply", for: .normal)
        buttonMultiply.tintColor = .systemBlue
        buttonMultiply.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonMultiply)
        
        buttonMultiply.addTarget(self,
                    action: #selector(onButtonMultiply),
                    for: .touchUpInside)
    }
    
    func setupButtonDivide(){
        buttonDivide = UIButton(type: .system) //You need to set the type when you create a Button. We use default system button...
        buttonDivide.setTitle("Divide", for: .normal)
        buttonDivide.tintColor = .systemBlue
        buttonDivide.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonDivide)
        
        buttonDivide.addTarget(self,
                    action: #selector(onButtonDivide),
                    for: .touchUpInside)
    }
    
    //Initializing the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate(
            [
                // Constraints for lableTilte
                lableTilte.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
                lableTilte.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                // Constraints for both text feild
                textFirstNumber.topAnchor.constraint(equalTo: lableTilte.bottomAnchor, constant: 24),
                textFirstNumber.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                textSecondNumber.topAnchor.constraint(equalTo: textFirstNumber.bottomAnchor, constant: 16),
                textSecondNumber.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                textFirstNumber.leadingAnchor.constraint(equalTo: textSecondNumber.leadingAnchor),
                textFirstNumber.trailingAnchor.constraint(equalTo: textSecondNumber.trailingAnchor),
                
                // Constraints for label Operation
                labelOperation.topAnchor.constraint(equalTo: textSecondNumber.bottomAnchor, constant: 24),
                labelOperation.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                // Constraints for buttons
                buttonAdd.topAnchor.constraint(equalTo: labelOperation.bottomAnchor, constant: 16),
                buttonAdd.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonSubtract.topAnchor.constraint(equalTo: buttonAdd.bottomAnchor, constant: 12),
                buttonSubtract.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonMultiply.topAnchor.constraint(equalTo: buttonSubtract.bottomAnchor, constant: 12),
                buttonMultiply.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                buttonDivide.topAnchor.constraint(equalTo: buttonMultiply.bottomAnchor, constant: 12),
                buttonDivide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                // Constraints for results
                labelResult.topAnchor.constraint(equalTo: buttonDivide.bottomAnchor, constant: 24),
                labelResult.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
  
            ]
        )
    }
    
    
    
    @objc func onButtonPlus(){
        //Unwrapping the optional text...
        if let numbers = valueCheck() {
            resultValueSetter(value:numbers[0] + numbers[1]);
        }
        
    }
    
    
    @objc func onButtonSubtract(){
        //Unwrapping the optional text...
        if let numbers = valueCheck() {
            resultValueSetter(value:numbers[0] - numbers[1]);
        }
        
    }
    
    @objc func onButtonMultiply(){
        //Unwrapping the optional text...
        if let numbers = valueCheck() {
            resultValueSetter(value:numbers[0] * numbers[1]);
        }
        
    }
    
    @objc func onButtonDivide(){
        //Unwrapping the optional text...
        if let numbers = valueCheck() {
            if (numbers[1] == 0) {
                let alert = UIAlertController(title: "Error!", message: "Divisor cannot be 0", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true)
            } else {
                resultValueSetter(value:numbers[0] / numbers[1]);
            }
            
        }
        
    }

    
    func valueCheck() -> [Double]? {
        let unwrappedFirst:String = textFirstNumber.text!
        
        let unwrappedSecond:String = textSecondNumber.text!

        
        if (unwrappedFirst.isEmpty || unwrappedSecond.isEmpty) {
        // triger the alert
            let alert = UIAlertController(title: "Error!", message: "The numbers cannot be empty!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
            
            return nil;
        }
        
        return [Double(unwrappedFirst)!, Double(unwrappedSecond)!]
    }
    
    func resultValueSetter(value:Double) {
        let resultValueString = String(value);
        if resultValueString.suffix(2) == ".0" {
            labelResult.text = String(resultValueString.dropLast(2));
        } else {
            labelResult.text = resultValueString;
        }
    }
}



