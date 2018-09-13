//
//  Farmaco.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 24/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import Foundation

class Farmaco{
    
    private var nome : String = ""
    private var principio : String = ""
    private var giornoOra : GiornoOraFarmaci = GiornoOraFarmaci()
    
    init(){
    }
    
    init(old: Farmaco) {
        self.nome = old.getNome()
        self.principio = old.getPrincipio()
        self.giornoOra = old.getGiornoOra()
    }
    
    func addGiornoOra(orario: Date, giorno: String, dose: String){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let formatted = formatter.string(from: orario)
        
        /*self.giornoOra.append(GiornoOraFarmaci(giorno: giorno, dose: dose, ora: formatted))
        print(self.giornoOra[(giornoOra.count - 1)].getUltimaOra(giorno: giorno), "  ", self.giornoOra[(giornoOra.count - 1)].getUltimaDose(giorno: giorno))*/
        
        self.giornoOra.addDoseOra(giorno: giorno, dose: dose, ora: formatted)
        print(self.giornoOra.getUltimaOra(giorno: giorno))
        print(self.giornoOra.getUltimaDose(giorno: giorno))
    }
    
    func getNome() -> String {
        return self.nome
    }
    
    func setNome(nome: String) {
        self.nome = nome
    }
    
    func getPrincipio() -> String {
        return self.principio
    }
    
    func setPrinicipio(principio: String) {
        self.principio = principio
    }
    
    func getGiornoOra() -> GiornoOraFarmaci {
        return self.giornoOra
    }
}
