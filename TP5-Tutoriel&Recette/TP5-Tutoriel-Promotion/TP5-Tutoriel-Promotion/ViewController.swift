//
//  ViewController.swift
//  TP5-Tutoriel-Promotion
//
//  Created by Frederic Dabadie on 03/04/2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var txtNom: UITextField!
    @IBOutlet weak var lblPromotion: UILabel!
    var promotion : [NSManagedObject] = []
    

    func printPromotion()
    {
        lblPromotion.text = promotion.map{$0.value(forKeyPath: "nom") as! String}.joined(separator:"\n")
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let etudiant = NSManagedObject.init(entity: NSEntityDescription.entity(
        forEntityName: "Etudiant", in:managedContext)!,
        insertInto: managedContext)
        etudiant.setValue(txtNom.text ?? "", forKeyPath: "nom")
        do {
            try managedContext.save()
                promotion.append(etudiant)
            } catch let error as NSError {
                print("Erreur d'enregistrement :  \(error), \(error.userInfo)")
        }
        txtNom.text = nil
        printPromotion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
         let managedContext = appDelegate.persistentContainer.viewContext
        
        let etudiant = Etudiant.init(entity: NSEntityDescription.entity(
            forEntityName: "Etudiant", in:managedContext)!,
            insertInto: managedContext)
        let enseignant = Enseignant.init(entity: NSEntityDescription.entity(
            forEntityName: "Enseignant", in:managedContext)!,
            insertInto: managedContext)
        
        etudiant.nom = "Smith"
        etudiant.prenom = "John"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        etudiant.dateDeNaissance = formatter.date(from: "2000/10/08")
        etudiant.formation = "DUT1"
        etudiant.redoublant = true
        enseignant.nom = "Guinaudeau"
        enseignant.prenom = "Camille"
        enseignant.isChercheur = true
        enseignant.addToEnseigne(etudiant)
        etudiant.addToSuitLesCours(enseignant)
         
        print(etudiant)
        print(enseignant)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Etudiant")
        let filter = "Smith"
        let commitPredicate = NSPredicate(format: "nom == %@", filter)
        fetchRequest.predicate = commitPredicate
        
       do {
           promotion = try managedContext.fetch(fetchRequest)
       } catch let error as NSError {
           print("Erreur lors de la récupération des données \(error),\(error.userInfo)")
       }
        printPromotion()
    }
}

