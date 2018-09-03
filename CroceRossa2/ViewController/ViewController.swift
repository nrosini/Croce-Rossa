//
//  ViewController.swift
//  CroceRossa2
//
//  Created by Informatica on 19/04/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var loginout: UIButton!
    @IBOutlet weak var registrazione: UIButton!
    
    var modello=Modello()
    var database=Database()
    var db: OpaquePointer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginout.layer.cornerRadius = 4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     @IBAction func login(_ sender: UIButton) {
        modello.setCampi(username: user.text!, password: pass.text!)
        performSegue(withIdentifier: "prova", sender: self)
        
        let nome = user.text?.trimmingCharacters(in: .whitespacesAndNewlines) as! NSString
        var passw = pass.text?.trimmingCharacters(in: .whitespacesAndNewlines) as! NSString
        
        database.login(username: nome, passw: passw)

    }
    
    
    @IBAction func registrati(_ sender: UIButton) {
        //bottone registrati
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination=segue.destination as? HomeViewController
        destination?.home = modello
    }
    
}

