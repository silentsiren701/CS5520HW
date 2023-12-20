//
//  EditRewardViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/8/23.
//

import UIKit
import PhotosUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class EditRewardViewController: UIViewController {

    var currentUser: User?
    var myReward: Reward?
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    let notificationCenter = NotificationCenter.default
    let ediRwdView = EditRewardView()
    
    var pickedImage:UIImage?
        
    override func loadView() {
        view = ediRwdView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Edit Reward"
        
        ediRwdView.buttonTakePhoto.menu = getMenuImagePicker()
        ediRwdView.buttonTakePhoto.loadRemoteImage(from: myReward!.photoURL)
        ediRwdView.pointSlider.value = Float(myReward!.rewardPts)
        ediRwdView.titleBlock.text = myReward!.title
        ediRwdView.descriptionBlock.text = myReward!.description
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSubmitTapped))
    }
    
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
                print("hi2")
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        print("hi3")
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                print("hi4")
                                profilePhotoURL = url
                                self.editReward(photoURL: profilePhotoURL)
                            }
                        })
                    } else {
                        print("hi9")
                        if let err = error {
                            print("Error writing document: \(err)")
                        } else {
                            print(error)
                            print("hi10")
                        }
                    }
                })
            }
        }else{
            editReward(photoURL: profilePhotoURL)
        }
    }
    
    func editReward(photoURL: URL?) {
        // Add a new document in collection "cities"
        print("hi4.5")
        if let tempURL = photoURL {
            let actualURL = tempURL.absoluteString
            print("hi5")
            // Check data are correct
            if let titleContent = ediRwdView.titleBlock.text,
                let descriptionContent = ediRwdView.descriptionBlock.text,
               titleContent != "", descriptionContent != ""{
                
                let pts = Int(ediRwdView.pointSlider.value)
                
                db.collection("userData")
                    .document(currentUser!.email.lowercased())
                    .collection("Reward")
                    .document(myReward!.id!)
                    .updateData([
                        "title": titleContent,
                        "description": descriptionContent,
                        "rewardPts":pts,
                        "photoURL": actualURL
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            self.navigationController?.popViewController(animated: true)
                            print("Document successfully written!")
                            
                            self.notificationCenter.post(
                                name: .RewardEdited,
                                object: nil)
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
            if let titleContent = ediRwdView.titleBlock.text,
                let descriptionContent = ediRwdView.descriptionBlock.text,
               titleContent != "", descriptionContent != ""{
                
                let pts = Int(ediRwdView.pointSlider.value)
                
                db.collection("userData")
                    .document(currentUser!.email.lowercased())
                    .collection("Reward")
                    .document(myReward!.id!)
                    .updateData([
                        "title": titleContent,
                        "description": descriptionContent,
                        "rewardPts":pts,
                        "photoURL": tempURL
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            self.navigationController?.popViewController(animated: true)
                            print("Document successfully written!")
                            
                            self.notificationCenter.post(
                                name: .RewardEdited,
                                object: nil)
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
