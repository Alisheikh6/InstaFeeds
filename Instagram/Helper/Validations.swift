//
//  Validations.swift
//  Instagram
//
//  Created by sheikh on 11/4/22.
//

import Foundation


class Validation {
    
     class func validateUsername(username: String) -> Bool{
        
        if username.count >= 8 {
            return true
        }
        return false
    }

    class func validatePassword(pass: String) -> Bool {
        
        if pass.count > 8 {
            return true
        }else {
            return false
        }
    }
    
    class func validateEmail(email: String) -> Bool {
        
        if email.count < 10 {
            return true
        }
        return false
        
    }
    
    
}
