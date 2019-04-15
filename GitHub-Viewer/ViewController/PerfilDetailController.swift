//
//  PerfilDetailController.swift
//  GitHub-Viewer
//
//  Created by Yan Meneguelli on 14/04/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit
import AlamofireImage

class PerfilDetailController: UIViewController {

    
    var gitPerfil:[Owner] = []
    var gitDetails:[GitPerfil] = []
    
    
    let TableView :UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = #colorLiteral(red: 1, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        return tableview
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: UIControl.State.normal)
        button.setTitle("< Back", for: UIControl.State.normal)
        return button
    }()
    
    let boxView: UIView = {
        let vieW = UIView()
        vieW.backgroundColor = #colorLiteral(red: 0.8914578046, green: 0.8914578046, blue: 0.8914578046, alpha: 0.4749571918)
        return vieW
    }()


    let characterImage = UIImageView()

    let characterLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Username"
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInicialLayout()
        setupButton()
        setupImage()
        setupTable()
        updateNameAndPhoto()
    }
    
    func setupInicialLayout(){
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.view.addSubview(boxView)
        boxView.translatesAutoresizingMaskIntoConstraints = false
        boxView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        boxView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        boxView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        boxView.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor,constant: 0).isActive = true
        boxView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        boxView.addSubview(characterLabel)
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        characterLabel.leadingAnchor.constraint(equalTo:self.boxView.leadingAnchor, constant: 150).isActive = true
        characterLabel.topAnchor.constraint(equalTo: self.boxView.topAnchor, constant: 145).isActive = true
    }
    
    func setupImage(){
        boxView.addSubview(characterImage)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        characterImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        characterImage.topAnchor.constraint(equalTo: self.boxView.topAnchor, constant: 15).isActive = true
        characterImage.leadingAnchor.constraint(equalTo:self.boxView.leadingAnchor, constant: 130).isActive = true
    }
    
    
    func setupTable(){
        self.view.addSubview(TableView)
        TableView.translatesAutoresizingMaskIntoConstraints = false
        TableView.topAnchor.constraint(equalTo: self.boxView.bottomAnchor).isActive = true
        TableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        TableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
    }
    
    func setupButton(){
        boxView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo:self.boxView.leadingAnchor, constant: 10).isActive = true
        backButton.topAnchor.constraint(equalTo: self.boxView.topAnchor, constant: 10).isActive = true
        backButton.addTarget(self, action: #selector(PerfilDetailController.buttonAction(_:)), for: .touchUpInside)
    }
    
    @objc func buttonAction(_ sender:UIButton!){
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateNameAndPhoto(){
        gitPerfil = [gitDetails[0].owner]
        characterLabel.text = gitPerfil[0].login
        let url = gitPerfil[0].avatar_url
        if let imageURL = URL(string: url) {
        characterImage.af_setImage(withURL: imageURL )
        }
    }
}
