//
//  loginTextField.swift
//  TheLastLogbook
//
//  Created by Nick George on 5/8/18.
//  Copyright © 2018 Nick George. All rights reserved.
//

import UIKit

@IBDesignable
class loginTextField: UITextField {
    override var tintColor: UIColor! {
        
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 2.0
        
        tintColor = #colorLiteral(red: 0.1647058824, green: 0.2078431373, blue: 0.2156862745, alpha: 1)
        tintColor.setStroke()
        
        path.stroke()
    }

}
