//
//  ViewController.swift
//  CroceRossa2
//
//  Created by Informatica on 19/04/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var loginout: UIButton!
    @IBOutlet weak var registrazione: UIButton!
    
    var modello=Modello()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginout.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     @IBAction func login(_ sender: UIButton) {
        modello.setCampi(username: user.text!, password: pass.text!)
        performSegue(withIdentifier: "prova", sender: self)
    }
    
    
    @IBAction func registrati(_ sender: UIButton) {
        //bottone registrati
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination=segue.destination as? HomeViewController
        destination?.home = modello
        
    }
}

