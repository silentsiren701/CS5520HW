//
//  ViewController.swift
//  FinalProject_Xu_Brunkhorst
//
//  Created by Matthew Brunkhorst on 12/12/23.
//

import Foundation
import UIKit

extension UIButton {
    //MARK: Borrowed from: https://www.hackingwithswift.com/example-code/uikit/how-to-load-a-remote-image-url-into-uiimageview
    
    func loadRemoteImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
                    }
                }
            }
        }
    }
}
