//
//  CustomButton.swift
//  GitHub-Viewer
//
//  Created by Yan Meneguelli on 13/04/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton(){
        setupInicial()
    }
    
     private func setupInicial(){
        let xPostion:CGFloat = 125
        let yPostion:CGFloat = 350
        let buttonWidth:CGFloat = 120
        let buttonHeight:CGFloat = 40
        frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        tintColor  = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        layer.cornerRadius = 5
        titleLabel?.font =  .systemFont(ofSize: 20, weight: .heavy)
        setTitle("Search", for: UIControl.State.normal)
    }
    
    
}
