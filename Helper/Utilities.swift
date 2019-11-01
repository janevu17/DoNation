//
//  Utilities.swift
//  HiWorld
//
//  Created by Thao Vu on 10/26/19.
//  Copyright © 2019 Thao Vu. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField( textField: UITextField ) {
        
        //Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 45/255, green: 50/255, blue: 50/255, alpha: 1).cgColor
        
        //remove border on text field
        textField.borderStyle = .none
        
        textField.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton (button:UIButton) {
        
        //Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 45/255, green: 50/255, blue: 50/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton (button: UIButton) {
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
