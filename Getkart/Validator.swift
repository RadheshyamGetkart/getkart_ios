//
//  Validator.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import Foundation


class Validator{
    
    class func validateEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    
    class  func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        // Define the regex pattern for a valid phone number (10 digits)
        let phoneRegex = "^[0-9]{10}$"
        
        // Use NSPredicate to match the phone number with the regex pattern
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        
        // Check if the phone number matches the pattern
        let isValidFormat = phoneTest.evaluate(with: phoneNumber)
        
        // Additional check to ensure that all digits are not the same (e.g., 9999999999)
        let allCharactersAreSame = Set(phoneNumber).count == 1
        
        // Return true if the phone number is valid and not a repeated digit
        return isValidFormat && !allCharactersAreSame
    }

}
