//
//  DataHandler.swift
//  MD5Hash
//
//  Created by Jonathan Lam on 1/14/17.
//  Copyright © 2017 Limitless. All rights reserved.
//

import Foundation
import OAuthSwift

class DataHandler {
    public func getMemes(completion:(_ memes: [String]?) -> Void){
        // authenticate()
        completion(nil)
    }
    
    private func authenticate(){
        let oauthswift = OAuth2Swift(
            consumerKey:    "8ca597c0f5048eb",
            consumerSecret: "23cf26b6c62908e84624ef6f0fff30ac37ba4f25",
            authorizeUrl:   "https://api.imgur.com/oauth2/authorize",
            responseType:   "token"
        )
        let handle = oauthswift.authorize(
            withCallbackURL: URL(string: "oauth-swift://oauth-callback/instagram")!,
            scope: "", state: "",
            success: { credential, response, parameters in
                print(credential.oauthToken)
        },
            failure: { error in
                print(error.localizedDescription)
        }
        )
        
        
    }
}
