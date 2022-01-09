//
//  LoginButton.swift
//  ALSE
//
//  Created by Nick George on 6/2/20.
//  Copyright © 2020 SimpleDev Studios. All rights reserved.
//

import UIKit

@IBDesignable
class LoginButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        signupbutton()
    }
    
    override func prepareForInterfaceBuilder() {
        signupbutton()
    }
    
    func signupbutton() {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 8.0
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    }
}
