//
//  ViewController.swift
//  TP2-PremiereClasse
//
//  Created by Frederic Dabadie on 17/03/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    var Personnes : [Int: Personne] = [:]
    
    
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var genre: UISegmentedControl!
    
    @IBAction func button(_ sender: Any) {
        
        let id = Personnes.count + 1
        let nomValue = nom.text ?? ""
        let prenomValue = prenom.text ?? ""
        let telValue = tel.text ?? ""
        let emailValue = email.text ?? ""
        let genreValue = genre.titleForSegment(at: genre.selectedSegmentIndex) ?? ""
          
        
        if(nomValue != "" && prenomValue != "" && telValue != "" && emailValue != "" ) {
            let p = Personne(id: id, genre: genreValue, nom: nomValue, prenom: prenomValue, adresseMail: emailValue, telephone: telValue)
            Personnes[id] = p
        } else {
            print("Veuillez remplir tous les champs")
        }
        
        nom.text = ""
        prenom.text = ""
        tel.text = ""
        email.text = ""
        genre.selectedSegmentIndex = 0
        
        for (_, personne) in Personnes {
            print(personne.description)
        }
       
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        let p1 = Personne(id: 1, genre: "M", nom: "Dupont", prenom: "Jean", adresseMail: "jean.dupont@example.com", telephone: "01 23 45 67 89")
        let p2 = Personne(id: 2, genre: "F", nom: "Durand", prenom: "Marie", adresseMail: "marie.durand@example.com", telephone: "02 34 56 78 90")

        print(p1.description)
        print(p2.description)
    }
}

