//
//  String.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 12/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//
import UIKit

extension String {
    func isValidCPF() -> Bool {
        let numbers = compactMap({ Int(String($0)) })
        
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = slice.count + 2
            
            let digit = 11 - slice.reduce(into: 0) {
                number -= 1
                $0 += $1 * number
                } % 11
            
            return digit > 9 ? 0 : digit
        }
        
        let dv1 = digitCalculator(numbers.prefix(9))
        let dv2 = digitCalculator(numbers.prefix(10))
        
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValidate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isValidEmail = emailValidate.evaluate(with: self)
        return isValidEmail
    }
    
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*#?&])[A-Za-z0-9$@$!%*#?&]{3,}$"
        let passwordValidate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let isValidPassword = passwordValidate.evaluate(with: self)
        
        return isValidPassword
    }
    
    func trimmed() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
     
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        return Set(self).isSubset(of: nums)
    }
    
    func maskAgency() -> String {
        if self.isNumeric {
            var characters = Array(self)
            
            characters.insert(".", at: 2)
            characters.insert("-", at: 9)
            
            return String(characters)
        } else {
            return self
        }
    }
}
