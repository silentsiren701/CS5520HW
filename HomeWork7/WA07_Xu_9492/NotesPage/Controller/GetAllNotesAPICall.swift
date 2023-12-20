//
//  GetAllNotesAPICall.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/4/23.
//

import Foundation
import Alamofire

extension NotesPageViewController:GetAllNoteProtocol, deleteNoteProtocol, logoutProtocol {

    func getall(token: String) {
        print("Yeah")
        if let url = URL(string: APIConfigs.NotesURL+"getall"){
            AF.request(url, method: .get, headers: ["x-access-token" : token])
                .responseData(completionHandler: { response in
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
                                let decoder = JSONDecoder()
                                do{
                                    let receivedData =
                                        try decoder
                                        .decode(Notes.self, from: data)
                                        
                                    self.notificationCenter.post(
                                        name: .notesRecieved,
                                        object: receivedData)
                                    
                                }catch{
                                    print("JSON couldn't be decoded: \(error)")
                                }
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
    
    func delete(token: String, note: Note) {
        if let url = URL(string: APIConfigs.NotesURL+"delete"){
            AF.request(url, method: .post,
                       parameters: ["id": note._id],
                       headers: ["x-access-token" : token])
                .responseData(completionHandler: { response in
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
                                let decoder = JSONDecoder()
                                do{
                                    let receivedData =
                                        try decoder
                                        .decode(DeleteNote.self, from: data)
                                    if (receivedData.delete) {
                                        // MARK: Succesfully posted
                                        self.finishDelete(token: token, note: note)
                                    } else {
                                        // MARK: there is a problem with posting
                                        print("there is a problem with Deleting")
                                    }
                                
                                }catch{
                                    print("JSON couldn't be decoded: \(error)")
                                }
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
    
    func logout(token: String) {
        if let url = URL(string: APIConfigs.NotesURL+"logout"){
            AF.request(url, method: .get)
                .responseData(completionHandler: { response in
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
    
    func finishDelete(token:String,note: Note) {
        self.notificationCenter.post(
            name: .deleted,
            object: note)
    }
}

