//
//  PostNoteAPICall.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/5/23.
//

import Foundation
import Alamofire

extension NotesCreateViewController:PostNoteProtocol {

    func post(token: String, text: String) {
        if let url = URL(string: APIConfigs.NotesURL+"post"){
            AF.request(url, method: .post,
                    parameters: ["text": text],
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
                                        .decode(AddNote.self, from: data)
                                    if (receivedData.posted) {
                                        // MARK: Succesfully posted
                                        self.finishPost(note:receivedData.note)
                                    } else {
                                        // MARK: there is a problem with posting
                                        print("there is a problem with posting")
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
    
    func finishPost(note: Note) {
        navigationController?.popViewController(animated: true)
        
        self.notificationCenter.post(
            name: .posted,
            object: note)
    }
}
    
