//
//  UIExtensions.swift
//  MD5Hash
//
//  Created by Jonathan Lam on 1/14/17.
//  Copyright © 2017 Limitless. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setWithURL(_ url: String){
        if let url = URL(string: url) {
            self.kf.setImage(with: url)
        }else{
            print("Failed to set image with url: \(url)")
        }
    }
}
