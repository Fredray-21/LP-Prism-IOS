//
//  ViewController.swift
//  TP4-Navigation
//
//  Created by Frederic Dabadie on 28/03/2023.
//

import UIKit

class ViewController: UIViewController {
    var tableauValeur : Array<String> = []
    @IBOutlet weak var textField: UITextField!


    @IBAction func btnSave(_ sender: Any) {
        if(textField.text != "") {
            tableauValeur.append(textField.text!)
            textField.text = ""
        }
    }
    
    @IBAction func btnConsult(_ sender: Any) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showValue") {
            // Definition du controler de destinatation
            let destinationVC = segue.destination as! AffichageViewController
            
            // Transfert de données
            destinationVC.tableauAffichage = tableauValeur
        }
    }
    
    
    func reinitialisationTableau() {
        tableauValeur.removeAll()
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        reinitialisationTableau()
        textField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
