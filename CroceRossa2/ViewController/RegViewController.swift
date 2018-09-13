//
//  RegViewController.swift
//  CroceRossa2
//
//  Created by Informatica on 23/04/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {

    @IBOutlet weak var sexSegmentControl: UISegmentedControl!
    @IBOutlet weak var birthDayPicker: UIDatePicker!
    
    @IBOutlet weak var fieldNome: UITextField!
    @IBOutlet weak var fieldCognome: UITextField!
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldProvincia: UITextField!
    @IBOutlet weak var fieldCitta: UITextField!
    @IBOutlet weak var fieldIndirizzo: UITextField!
    @IBOutlet weak var fieldCAP: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var fieldPasswordConfirm: UITextField!
    @IBOutlet weak var fieldPhone: UITextField!
    
    @IBOutlet weak var privacySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func continueButton(_ sender: Any) {
        
        if checkCampi() {
            if checkPassword() {
                if privacySwitch.isOn {
                    print("OK")
                    
                    Database.nome = self.fieldNome.text!
                    Database.cognome = self.fieldCognome.text!
                    Database.provincia = self.fieldProvincia.text!
                    Database.citta = self.fieldCitta.text!
                    Database.password = self.fieldPassword.text!
                    
                    Database.birthDay = self.birthDayPicker.date
                    
                    if self.sexSegmentControl.selectedSegmentIndex == 0{
                        Database.sesso = "Donna"
                    } else {
                        Database.sesso = "Uomo"
                    }
                    
                    Database.email = self.fieldEmail.text!
                    Database.cap = self.fieldCAP.text!
                    Database.indirizzo = self.fieldIndirizzo.text!
                    Database.phone = self.fieldPhone.text!
                    
                    let controller = storyboard?.instantiateViewController(withIdentifier: "Questionario") as! QuestViewController
                    present(controller, animated: true, completion: nil)
                    
                } else {
                    let alert = UIAlertController(title: "Devi accettare le condizioni di privacy", message: "Devi accettare le condizioni sul trattamento dei dati personali", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                let alert = UIAlertController(title: "Password Errata", message: "le due password fornite non coincidono", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                
                self.fieldPassword.becomeFirstResponder()
            }
        } else {
            
            let alert = UIAlertController(title: "Immissione dei campi non completa", message: "riempire tutti i campi aventi l'asterisco", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkCampi() -> Bool{
        
        var bool = true
        
        if (self.fieldNome.text?.elementsEqual(""))!{
            bool = false
        }
        
        if (self.fieldCognome.text?.elementsEqual(""))!{
            bool = false
        }
        
        if (self.fieldProvincia.text?.elementsEqual(""))!{
            bool = false
        }
        
        if (self.fieldCitta.text?.elementsEqual(""))!{
            bool = false
        }
        
        if (self.fieldPassword.text?.elementsEqual(""))!{
            bool = false
        }
        
        if (self.fieldPasswordConfirm.text?.elementsEqual(""))!{
            bool = false
        }
        
        return bool
    }
    
    
    
    func checkPassword() -> Bool{
        
        if (self.fieldPassword.text?.elementsEqual(self.fieldPasswordConfirm.text!))!{
            return true
        } else {
            return false
        }
    }
    
}
