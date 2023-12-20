//
//  AddRewardViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import UIKit
import PhotosUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class AddRewardViewController: UIViewController {
    
    var currentUser: User?
    
    var pickedImage:UIImage?
    
    let storage = Storage.storage()
    let db = Firestore.firestore()
    let addRewardPage = AddRewardView()
        
    override func loadView() {
        view = addRewardPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add New Reward"
        pickedImage = UIImage(systemName: "camera.fill")
        
        addRewardPage.buttonTakePhoto.menu = getMenuImagePicker()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onSubmitTapped))
    }
    
    //MARK: menu for buttonTakePhoto setup...
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func onSubmitTapped() {
        //addReward()
        uploadPhotoToStorage()
        
    }
    
   
    
    func uploadPhotoToStorage(){
        var profilePhotoURL:URL?
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 70){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesRewards")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                _ = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                self.addReward(photoURL: profilePhotoURL)
                            }
                        })
                    } else {
                        if let err = error {
                            print("Error writing document: \(err)")
                        } else {
                            print(error)
                        }
                    }
                })
            }
        }else{
            addReward(photoURL: profilePhotoURL)
        }
    }
    
    func addReward(photoURL: URL?) {
        // Add a new document in collection "cities"
        if let tempURL = photoURL {
            let actualURL = tempURL.absoluteString
            // Check data are correct
            if let titleContent = addRewardPage.titleBlock.text,
                let descriptionContent = addRewardPage.descriptionBlock.text,
               titleContent != "", descriptionContent != ""{
                
                let pts = Int(addRewardPage.pointSlider.value)
                
                db.collection("userData")
                    .document(currentUser!.email.lowercased())
                    .collection("Reward")
                    .addDocument(data: [
                        "title": titleContent,
                        "description": descriptionContent,
                        "rewardPts":pts,
                        "time": Int64(Date().timeIntervalSince1970),
                        "photoURL": actualURL
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            self.navigationController?.popViewController(animated: true)
                            print("Document successfully written!")
                        }
                    }
            } else {
                let alert = UIAlertController(
                        title: "Error!", message: "Title and Description cannot be empty",
                        preferredStyle: .alert
                    )
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    
                    self.present(alert, animated: true)
            }
        } else {
            print("no image")
            let tempURL = URL(string: "https://firebasestorage.googleapis.com:443/v0/b/cs5520project-f3071.appspot.com/o/imagesRewards%2F8C2DA1BF-B48C-43D5-B7D2-07321C5A9DA0.jpg?alt=media&token=24ffb7cd-2e2c-4fcc-8b01-3be2c36d5411")?.absoluteString
            // Check data are correct
            if let titleContent = addRewardPage.titleBlock.text,
                let descriptionContent = addRewardPage.descriptionBlock.text,
               titleContent != "", descriptionContent != ""{
                
                let pts = Int(addRewardPage.pointSlider.value)
                
                db.collection("userData")
                    .document(currentUser!.email.lowercased())
                    .collection("Reward")
                    .addDocument(data: [
                        "title": titleContent,
                        "description": descriptionContent,
                        "rewardPts":pts,
                        "time": Int64(Date().timeIntervalSince1970),
                        "photoURL": tempURL
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            self.navigationController?.popViewController(animated: true)
                            print("Document successfully written!")
                        }
                    }
            } else {
                let alert = UIAlertController(
                        title: "Error!", message: "Title and Description cannot be empty",
                        preferredStyle: .alert
                    )
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    
                    self.present(alert, animated: true)
            }
        }
        
    }

    

}
