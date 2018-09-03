//
//  RegViewController.swift
//  CroceRossa2
//
//  Created by Informatica on 23/04/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {
    
    // sistemare seconda dichiarazione del database visto che scrive su due righe diverse
    var database = Database()
    
    @IBOutlet weak var textCognome: UITextField!
    @IBOutlet weak var textNome: UITextField!
    @IBOutlet weak var sex: UISegmentedControl!
    
    @IBAction func invia(_ sender: UIButton) {
        let nome = textNome.text?.trimmingCharacters(in: .whitespacesAndNewlines) as! NSString
        let cognome = textCognome.text?.trimmingCharacters(in: .whitespacesAndNewlines) as! NSString
        
        let sessoInt = sex.selectedSegmentIndex as Int
        var sesso = "" as! NSString
        switch sessoInt {
            case 0:
                sesso = "donna"
                break
            case 1:
                sesso = "uomo"
                break
            default:
                break
        }
        
        
        //database.register(cogn: cognome, nome: nome, sesso: sesso)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
