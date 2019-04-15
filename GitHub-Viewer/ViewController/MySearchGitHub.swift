//
//  ViewController.swift
//  GitHub-Viewer
//
//  Created by Yan Meneguelli on 13/04/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

class MySearchGitHub: UIViewController,UITextFieldDelegate {
    
    var button    = CustomButton()
    var textField = CustomTextField()
    var perfil:[GitPerfil] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInicial()
        DispatchQueue.main.async {
            self.setupButton()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func setupInicial(){
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.title = "GitHub Viewer"
        self.view.addSubview(textField)
        self.view.addSubview(button)
    }
    
    func setupButton(){
        button.addTarget(self, action: #selector(MySearchGitHub.buttonAction(_:)), for: .touchUpInside)
    }
    
    
    @objc func buttonAction(_ sender:UIButton!){
        
        if textField.text != ""{
            ServerApi().CallGitPerfil(username: textField.text!) { (GitPerfil) in
                if GitPerfil.isEmpty{
                    DispatchQueue.main.async {
                    Alert(controller: self).show(title: "Sorry", message: "User not found. Please enter another name")
                    }
                }else{
                    self.perfil.append(contentsOf: GitPerfil)
                    DispatchQueue.main.async {
                        let mydata = PerfilDetailController()
                        mydata.gitDetails = self.perfil
                        self.present(UINavigationController(rootViewController:mydata), animated: true,completion: nil)
                    }
                }
            }
        }else{
            Alert(controller: self).show(title: "Campo Vazio", message: "Por favor preencher o campo texto")
        }
        
        self.perfil.removeAll()
    }
}

