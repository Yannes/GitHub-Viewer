//
//  StructGit.swift
//  GitHub-Viewer
//
//  Created by Yan Meneguelli on 14/04/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.

import UIKit

struct GitPerfil:Decodable{
    let id: Int
    let node_id: String
    let name: String
    let full_name: String
    let `private`: Bool
    let owner: Owner
}


struct Owner:Decodable{
    let login: String
    let id: Int
    let node_id:String
    let avatar_url:String
}
