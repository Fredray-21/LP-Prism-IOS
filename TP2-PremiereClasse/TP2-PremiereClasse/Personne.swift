//
//  Personne.swift
//  TP2-PremiereClasse
//
//  Created by Frederic Dabadie on 17/03/2023.
//

import Foundation

class Personne {
    private var id : Int
    private var genre : String
    private var nom : String
    private var prenom : String
    private var adresseMail : String
    private var telephone : String
    
    var description: String {
        return "Id: \(self.id), Genre: \(self.genre), Nom: \(self.nom), Prénom: \(self.prenom), AdresseMail: \(self.adresseMail), Telephone: \(self.telephone)"
    }
    
    init(id: Int, genre: String, nom: String, prenom: String, adresseMail: String, telephone: String) {
        self.id = id
        self.genre = genre
        self.nom = nom
        self.prenom = prenom
        self.adresseMail = adresseMail
        self.telephone = telephone
    }
    
    convenience init(id: Int, genre: String, nom: String, prenom: String) {
        self.init(id: id, genre: genre, nom: nom, prenom: prenom, adresseMail: "", telephone: "")
    }
}
