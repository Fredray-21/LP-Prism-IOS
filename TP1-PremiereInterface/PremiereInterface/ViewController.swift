//
//  ViewController.swift
//  PremiereInterface
//
//  Created by Frederic Dabadie on 14/02/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var switchBtn: UISwitch!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Action effectué par le Slider
    @IBAction func SliderAction(_ sender: Any) {
        textLabel.text = "\(slider.value)" // changement texte du Label par la valeur du slider
    }
    // Action effectué par le Switch
    @IBAction func SwitchAction(_ sender: Any) {
        if(switchBtn.isOn) { // si switch est ON
            button.isEnabled = true // Active le bouton
        } else {
            button.isEnabled = false // Desactive le bouton
        }
    }
    
    // Action effectué par le Bouton
    @IBAction func btnAction(_ sender: Any) {
        if(loader.isAnimating) { // si le loader est entrain de tourner
            button.setTitle("Tournez", for: .normal) // Changement du text du bouton
            loader.stopAnimating()  // Stop animation du Loader
        } else {
            button.setTitle("Stop", for: .normal) // Changement du text du bouton
            loader.startAnimating() // Stop animation du Loader
            
        }
    }
    // Action effectué par le Controlleur segments
    @IBAction func ControlAction(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex { // switch sur l'index
        case 0:
            self.view.backgroundColor = UIColor.systemRed // changemnt background en Rouge
        case 1:
            self.view.backgroundColor = UIColor.systemBlue // changemnt background en Bleu
        case 2:
            self.view.backgroundColor = UIColor.systemYellow // changemnt background en Jaune
        default:
            self.view.backgroundColor = UIColor.white // Par defaut background en Blanc
        }
    }
}
