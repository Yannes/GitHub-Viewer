//
//  ServerAPI.swift
//  GitHub-Viewer
//
//  Created by Yan Meneguelli on 14/04/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit
import Alamofire



class ServerApi: NSObject {
    
  func CallGitPerfil(username:String,completion: @escaping(_ Sucesso: [GitPerfil]) ->()){
    
    let urlString = "https://api.github.com/users/\(username)/repos"

    guard let url = URL(string: urlString) else {return}
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print(error!.localizedDescription)
        }
        guard let data = data else{return}
        do {
            let gitResponse = try JSONDecoder().decode([GitPerfil].self, from: data)
            completion(gitResponse)
        } catch let jsonError{
           print(jsonError)
           Alert(controller: MySearchGitHub()).show(title: "Sorry", message: "A network error has occurred. Check your Internet connection and try again later.")
        }
        }.resume()
    }
}
