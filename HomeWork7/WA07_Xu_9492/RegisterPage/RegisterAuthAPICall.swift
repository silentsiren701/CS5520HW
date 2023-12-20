//
//  RegisterAuthAPICall.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/2/23.
//

import Foundation
import UIKit
import Alamofire

extension RegisterPageViewController:AuthTokenRegisterProtocol {
    

    func register(name: String, email: String, password: String) {
        if let url = URL(string: APIConfigs.AuthURL+"register"){
            AF.request(url, method: .post, parameters: [
                                            "name": name,
                                            "email": email,
                                            "password": password
                                        ]
            ).responseData(completionHandler: { response in
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
                                        .decode(AuthToken.self, from: data)
                                    if (receivedData.auth) {
                                        // MARK: authed
                                        
                                        self.notificationCenter.post(
                                            name: .tokenRecieved,
                                            object: receivedData.token)
                                        
                                        print("Auth Token Get \(receivedData.token)")
                                    } else {
                                        // fail to auth
                                        let alert = UIAlertController(title: "Error!", message: "This email is already occupied", preferredStyle: .alert)
                                        
                                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                                        
                                        self.present(alert, animated: true)
                                        
                                        print("Auth Token can't be issued")
                                    }
                                }catch{
                                    print("JSON couldn't be decoded.")
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
}
