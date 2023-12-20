//
//  SignInAPICall.swift
//  WA07_Xu_9492
//
//  Created by Aiden Hsu on 11/2/23.
//

import Foundation
import UIKit
import Alamofire


extension ViewController:AuthTokenSignInProtocol {
    func login(email:String, password:String) {
        if let url = URL(string: APIConfigs.AuthURL+"login"){
            AF.request(url, method: .post, parameters: [
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
                                        let alert = UIAlertController(title: "Error!", message: "Check password or email", preferredStyle: .alert)
                                        
                                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                                        
                                        self.present(alert, animated: true)
                                    }
                                }catch{
                                    print("JSON couldn't be decoded.")
                                    let alert = UIAlertController(title: "Error!", message: "Check password or email", preferredStyle: .alert)
                                    
                                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                                    
                                    self.present(alert, animated: true)
                                }
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                            let alert = UIAlertController(title: "Error!", message: "Check password or email", preferredStyle: .alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            
                            self.present(alert, animated: true)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                            let alert = UIAlertController(title: "Error!", message: "Check password or email", preferredStyle: .alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            
                            self.present(alert, animated: true)
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
