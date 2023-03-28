//
//  ViewController.swift
//  Protocole
//
//  Created by Camille Guinaudeau on 21/01/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var choixCivilite: UISegmentedControl!
    @IBOutlet weak var textNom: UITextField!
    @IBOutlet weak var textId: UITextField!
    @IBOutlet var textPrenom: UITextField!
    @IBOutlet var textAdresseMail: UITextField!
    @IBOutlet var textTelephone: UITextField!
    @IBOutlet weak var btnEnregistrer: UIButton!
    @IBOutlet var affichageNouvellePersonne: UILabel!
    @IBOutlet var erreurNom: UILabel!
    @IBOutlet var erreurPrenom: UILabel!
    @IBOutlet var erreurMail: UILabel!
    @IBOutlet var erreurTelephone: UILabel!
    @IBOutlet weak var erreurId: UILabel!
    var dict_personnes: [Int: Personne] = [:]
    var genrePersonne: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textId.delegate = self
        textNom.delegate = self
        textPrenom.delegate = self
        textAdresseMail.delegate = self
        textTelephone.delegate = self
        
        let personne1 = Personne()
        let personne2 = Personne(id: 2, genre: "F", nom: "Dupont", prenom: "Marie", adresseMail: "marie.dupont@u-psud.fr", telephone: "0695858687")
        print((personne1.description))
        print((personne2.description))
        
        choixCivilite.selectedSegmentIndex = UISegmentedControl.noSegment
        
        erreurNom.text = ""
        erreurPrenom.text = ""
        erreurMail.text = ""
        erreurTelephone.text = ""
        erreurId.text = ""
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch(textField) {
        case textNom :
            erreurNom.text =  textNom.text == "" ?" Veuillez saisir un nom." : ""
        break
        case textPrenom :
            erreurPrenom.text =  textPrenom.text == "" ? "Veuillez saisir un prénom." : ""
        break
        case textAdresseMail :
            erreurMail.text =  textAdresseMail.text == "" ? "Veuillez saisir une adresse email." : ""
        break
        case textTelephone :
            erreurTelephone.text =  textTelephone.text == "" ? "Veuillez saisir une adresse email." : ""
        break
        default:
        break
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if(textField == textAdresseMail) {
            if(!valideMail(adresse: textAdresseMail.text!)) {
                erreurMail.text = "Email non valide"
                return false;
            }
        }
        
        if(textField == textTelephone) {
            if(!valideTelephone(numero: textTelephone.text!)) {
                erreurTelephone.text = "Telephone non valide"
                return false;
            }
        }
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch(textField) {
        case textNom :
            erreurNom.text = ""
        break
        case textPrenom :
            erreurPrenom.text = ""
        break
        case textAdresseMail :
            erreurMail.text = ""
        break
        case textTelephone :
            erreurTelephone.text = ""
        break
        default:
        break
    }
    }

    func validTextField() {
        if(textId.text != "" && textNom.text != "" && textPrenom.text != "" && valideMail(adresse: textAdresseMail.text!) && valideTelephone(numero: textTelephone.text!) && genrePersonne != "") {
            btnEnregistrer.isEnabled = true
        } else {
            btnEnregistrer.isEnabled = false
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        validTextField()
    }
    
    @IBAction func segmentControl(_ sender: Any) {
        genrePersonne = "\(choixCivilite.selectedSegmentIndex)"
        validTextField()
    }
    

    
    func valideMail(adresse: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        return regex.firstMatch(in: adresse, options: [], range: NSRange(location: 0, length: adresse.utf16.count)) != nil
    }

    func valideTelephone(numero: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^\\d{10}$")
        return regex.firstMatch(in: numero, options: [], range: NSRange(location: 0, length: numero.utf16.count)) != nil
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func enregistrer(_ sender: AnyObject) {
        var g = "M"
        if (choixCivilite.selectedSegmentIndex == 0) {
            g = "M"
        }
        if (choixCivilite.selectedSegmentIndex == 1) {
            g = "F"
        }
        if (choixCivilite.selectedSegmentIndex == 2) {
            g = "Non binaire"
        }
        
        let personne = Personne()
        personne.id = Int(textId.text!)!
        personne.genre = g
        personne.nom = textNom.text!
        personne.prenom = textPrenom.text!
        personne.adresseMail = textAdresseMail.text!
        personne.telephone = textTelephone.text!
        
        affichageNouvellePersonne.text = "\(personne.description)"
        dict_personnes[personne.id] = personne
        print("Nous avons enregistré \(dict_personnes.count) personnes, les voici : ")
        for (id, pers) in dict_personnes {
            print(id)
            print(pers.description)
        }
        
        self.cleanInterface()
    }
    
    func cleanInterface() {
        textTelephone.resignFirstResponder()
        
        textId.text = ""
        textNom.text = ""
        textPrenom.text = ""
        textAdresseMail.text = ""
        textTelephone.text = ""
        choixCivilite.selectedSegmentIndex = UISegmentedControl.noSegment
        
        erreurId.text = ""
        erreurNom.text = ""
        erreurPrenom.text = ""
        erreurMail.text = ""
        erreurTelephone.text = ""
    }
}


