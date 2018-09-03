//
//  modello.swift
//  CroceRossa2
//
//  Created by Informatica on 19/04/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import Foundation

class Modello{
    var username=""
    var password=""
    
    static let shared = Modello()
    
    func setCampi(username : String, password : String){
        self.password=password
        self.username=username
        
    }
}
