//
//  AffichageViewController.swift
//  TP4-Navigation
//
//  Created by Frederic Dabadie on 28/03/2023.
//

import UIKit

class AffichageViewController: UIViewController, UITableViewDataSource {
    var tableauAffichage : Array<String> = []
    
    @IBOutlet weak var lblAffichage: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var lblText = ""
        tableauAffichage.forEach {
            lblText += "\($0),"
        }
        lblAffichage.text = lblText
        lblCount.text = "\(tableauAffichage.count) élément\((tableauAffichage.count > 1 ? "s" : ""))"
        
        
        // Enregistre une classe de cellule
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Définir la source de données de la tableview
        tableView.dataSource = self
        // Actualiser la tableview pour afficher les données
        tableView.reloadData()
    }
    
    // Retourne le nombre de lignes à afficher dans la section spécifiée de la tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableauAffichage.count
    }
    
    // Configure et retourne une cellule pour l'index path spécifié
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableauAffichage[indexPath.row]
        return cell
    }
}
