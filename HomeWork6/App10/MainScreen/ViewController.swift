//
//  ViewController.swift
//  App10
//
//  Created by Sakib Miazi on 5/25/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    //MARK: list to display the contact names in the TableView...
    var contactNames = [String]()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts JSON API"
        
        //MARK: setting the delegate and data source...
        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
        //MARK: removing the separator line...
        mainScreen.tableViewContacts.separatorStyle = .none
        
        //get all contact names when the main screen loads...
        getAllContacts()
        
        //MARK: add action to Add Contact button...
        mainScreen.buttonAdd.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
    }
    
    @objc func onButtonAddTapped(){
        //do the validations...
        if let name = mainScreen.textFieldAddName.text,
           let email = mainScreen.textFieldAddEmail.text,
           let phoneText = mainScreen.textFieldAddPhone.text{
            
            if let contact = dataToContact(name: name, email: email, phone: phoneText) {
                //MARK: call add a new contact API endpoint...
                addANewContact(contact: contact)
            }else{
                //alert...
            }
        }
        else{
            //alert....
        }
    }
    
    func clearAddViewFields(){
        mainScreen.textFieldAddName.text = ""
        mainScreen.textFieldAddEmail.text = ""
        mainScreen.textFieldAddPhone.text = ""
    }
    
    func showDetails(data: String){
        let parts = data.components(separatedBy: ",")
        print(parts)
        
        //MARK: trim the whitespaces from the strings, and show alert...
        let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
        let email = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
        if let phone = Int(parts[2].trimmingCharacters(in: .whitespacesAndNewlines)){
            // Create contact and the detail view controller
            let contactPackage = Contact(name: name, email: email, phone: phone)
            let detailScreen = ContactsDetailViewController()
            detailScreen.contactDetail = contactPackage
            // Push the detail view controller
            navigationController?.pushViewController(detailScreen, animated: true)
            notificationCenter.addObserver(
                        self,
                        selector: #selector(detailScreenModification(notification:)),
                        name: Notification.Name("orderFromDetailScreen"),
                        object: nil)
        }
        
    }
    
    @objc func detailScreenModification(notification: Notification) {
        let stringArray = (notification.object as! String).split(separator: ",").map { String($0) }
        print(stringArray)
        switch stringArray[0] {
        case "DELETE":
            deleteContact(contactName: stringArray[1])
            break
        case "EDIT":
            if let phone = Int(stringArray[4]) {
                let contactPackage = Contact(name: stringArray[2], email: stringArray[3], phone: phone)
                EditAContact(originalName: stringArray[1], contact: contactPackage)
            }
            break
        default:
            break
        }
    }
    
    //MARK: add a new contact call: add endpoint...
    func addANewContact(contact: Contact){
        
        if let url = URL(string: APIConfigs.baseURL+"add"){
            
            AF.request(url, method:.post, parameters:
                        [
                            "name": contact.name,
                            "email": contact.email,
                            "phone": contact.phone
                        ])
                .responseString(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                    print("Added:", data)
                                    self.getAllContacts()
                                    self.clearAddViewFields()
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
        }else{
            //alert that the URL is invalid...
        }
    }
    
    
    //MARK: add a new contact call: add endpoint...
    func EditAContact(originalName:String, contact: Contact){
        
        if let url = URL(string: APIConfigs.baseURL+"delete"){
            AF.request(url, method:.get,
                       parameters: ["name":originalName],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                    
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                    //MARK: show alert with details...
                                    print("Deleted:", data)
                                    self.addANewContact(contact: contact)
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
            }
    }
    
    //MARK: add a new contact call: add endpoint...
    func deleteContact(contactName: String){
        if let url = URL(string: APIConfigs.baseURL+"delete"){
            AF.request(url, method:.get,
                       parameters: ["name":contactName],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                    
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                    //MARK: show alert with details...
                                    print("Deleted:", data)
                                    self.getAllContacts()
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
            }
        }
    
    //MARK: get all contacts call: getall endpoint...
    func getAllContacts(){
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get).responseString(completionHandler: { response in
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                let names = data.components(separatedBy: "\n")
                                self.contactNames = names
                                self.contactNames.removeLast()
                                self.mainScreen.tableViewContacts.reloadData()
                                print(self.contactNames)
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }
    }
    
    //MARK: get details of a contact...
    func getContactDetails(name: String){
        if let url = URL(string: APIConfigs.baseURL+"details"){
            AF.request(url, method:.get,
                       parameters: ["name":name],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                //MARK: show alert with details...
                                self.showDetails(data: data)
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }
    }
    
    func dataToContact(name:String, email:String, phone:String) -> Contact? {
        if name.isEmpty {
            EmptyError(fieldName: "Name")
        }
        
        else if email.isEmpty {
            EmptyError(fieldName: "Email")
        } else if !isValidEmail(email) {
            otherError(content: "Email Address is invalid")
        }
        
        
        else if phone.isEmpty {
            EmptyError(fieldName: "PhoneNumber")
        } else if !(phone.count == 10) {
            otherError(content: "Phone number is invalid")
        } else {
            return Contact(name: name, email: email, phone: Int(phone)!)
        }
        return nil
    }
    
    
    func EmptyError(fieldName: String) {
        let alert = UIAlertController(title: "Error!", message: "The \(fieldName) cannot be empty!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func otherError(content: String) {
        let alert = UIAlertController(title: "Error!", message: content, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    // Citation: https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! ContactsTableViewCell
        cell.labelName.text = contactNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getContactDetails(name: self.contactNames[indexPath.row])
    }
}

