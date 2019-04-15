//
//  Extension.swift
//  GitHub-Viewer
//
//  Created by Yan Meneguelli on 15/04/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//
extension PerfilDetailController: UITableViewDelegate {

}

extension PerfilDetailController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitDetails.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        cell.detailTextLabel?.text = "teste"
        return cell
    }
}
