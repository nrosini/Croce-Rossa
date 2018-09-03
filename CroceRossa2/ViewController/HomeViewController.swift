//
//  HomeViewController.swift
//  CroceRossa2
//
//  Created by Informatica on 19/04/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var home=Modello()
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var username: UILabel!
    
    var Stringa = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        password.text=home.password
        username.text=home.username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
