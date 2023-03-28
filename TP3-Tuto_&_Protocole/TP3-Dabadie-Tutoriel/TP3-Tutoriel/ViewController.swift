//
//  ViewController.swift
//  TP3-Tutoriel
//
//  Created by Frederic Dabadie on 21/03/2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,
                      UIPickerViewDataSource {
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var labelResult: UILabel!
    
    let data1 : [String] = ["Café", "Thé", "Cappuccino", "Tisane"]
    let data2 : [String] = ["chaud", "tiède", "froid"]
    let data3 : [String] = ["sucré", "faiblement sucré", "non sucré"]
    
    var boisson : String = ""
    var chaleur : String = ""
    var sucre : String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return data1.count
        case 1:
            return data2.count
        case 2:
            return data3.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return data1[row]
        case 1:
            return data2[row]
        case 2:
            return data3[row]
        default:
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            boisson = data1[row]
        case 1:
            chaleur = data2[row]
        case 2:
            sucre = data3[row]
        default:
            break
        }
    }
    
    @IBAction func buttonCommander(_ sender: Any) {
        let resultat = "\(boisson) \(chaleur) \(sucre)"
        labelResult.text = resultat
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
}

