//
//  Esami.swift
//  CroceRossa2
//
//  Created by Nicolò Rosini on 06/09/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import Foundation

class Esame {
    private var nome: String = ""
    private var ora: Date = Date()
    
    init() {}
    
    func getNome() -> String {
        return self.nome
    }
    
    func setNome(nome: String) {
        self.nome = nome
    }
    
    func getOra() -> Date {
        return ora
    }
    
    func setOra(ora: Date) {
        self.ora = ora
    }
}
