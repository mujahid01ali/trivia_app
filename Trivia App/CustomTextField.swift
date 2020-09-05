//
//  CustomTextField.swift
//  Trivia App
//
//  Created by Mujahid on 05/09/20.
//  Copyright © 2020 Mujahid. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomTextField:UITextField{
    
    @IBInspectable var cornerRadius:CGFloat = 0.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0.0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.black{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var shadowColor:UIColor = UIColor.black{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowOffset:CGSize = CGSize(width: 0.0, height: 0.0){
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable var shadowRadius:CGFloat = 0.0{
        didSet{
            self.layer.shadowRadius = 0.0
        }
    }
    @IBInspectable var shadowOpacity:Float = 0.0{
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
}

