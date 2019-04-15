//
//  CustomTextField.swift
//  GitHub-Viewer
//
//  Created by Yan Meneguelli on 13/04/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuptextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setuptextField()
    }
    
    func setuptextField(){
        setupInicial()
    }
    
    private  func setupInicial(){
            frame = CGRect(x: 40 , y: 290, width: 300, height: 45)
            placeholder = "Username"
            font = UIFont.systemFont(ofSize: 15)
            borderStyle = UITextField.BorderStyle.roundedRect
            autocorrectionType = UITextAutocorrectionType.no
            keyboardType = UIKeyboardType.default
            returnKeyType = UIReturnKeyType.done
            clearButtonMode = UITextField.ViewMode.whileEditing
            contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
}
