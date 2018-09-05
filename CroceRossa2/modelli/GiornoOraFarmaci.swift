
//
//  GiornoOraFarmaci.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 27/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import Foundation

class GiornoOraFarmaci{
    
    init() {
    }
    
    private var lunedì : [DoseOra] = [DoseOra]()
    private var martedì : [DoseOra] = [DoseOra]()
    private var mercoledì : [DoseOra] = [DoseOra]()
    private var giovedì : [DoseOra] = [DoseOra]()
    private var venerdì : [DoseOra] = [DoseOra]()
    private var sabato : [DoseOra] = [DoseOra]()
    private var domenica : [DoseOra] = [DoseOra]()
    
    init(giorno: String, dose: String, ora: String) {
        
        switch giorno {
        case "Lunedì":
            self.lunedì.append(DoseOra(dose: dose, ora: ora))
        case "Martedì":
            self.martedì.append(DoseOra(dose: dose, ora: ora))
        case "Mercoledì":
            self.mercoledì.append(DoseOra(dose: dose, ora: ora))
        case "Giovedì":
            self.giovedì.append(DoseOra(dose: dose, ora: ora))
        case "Venerdì":
            self.venerdì.append(DoseOra(dose: dose, ora: ora))
        case "Sabato":
            self.sabato.append(DoseOra(dose: dose, ora: ora))
        default:
            self.domenica.append(DoseOra(dose: dose, ora: ora))
        }
    }
    
    func getUltimaOra(giorno: String) -> String{
        var ora : String
        
        switch giorno {
        case "Lunedì":
            ora = self.lunedì[self.lunedì.count - 1].getOra()
        case "Martedì":
            ora = self.martedì[self.martedì.count - 1].getOra()
        case "Mercoledì":
            ora = self.mercoledì[self.mercoledì.count - 1].getOra()
        case "Giovedì":
            ora = self.giovedì[self.giovedì.count - 1].getOra()
        case "Venerdì":
            ora = self.venerdì[self.venerdì.count - 1].getOra()
        case "Sabato":
            ora = self.sabato[self.sabato.count - 1].getOra()
        default:
            ora = self.domenica[self.domenica.count - 1].getOra()
        }
        
        return ora
    }
    
    func getOra(giorno: String, indice: Int) -> String{
        var ora : String
        
        switch giorno {
            case "Lunedì":
                ora = self.lunedì[indice].getOra()
            case "Martedì":
                ora = self.martedì[indice].getOra()
            case "Mercoledì":
                ora = self.mercoledì[indice].getOra()
            case "Giovedì":
                ora = self.giovedì[indice].getOra()
            case "Venerdì":
                ora = self.venerdì[indice].getOra()
            case "Sabato":
                ora = self.sabato[indice].getOra()
            default:
                ora = self.domenica[indice].getOra()
        }
        
        return ora
    }
    
    func getUltimaDose(giorno: String) -> String{
        var dose : String
        
        switch giorno {
        case "Lunedì":
            dose = self.lunedì[self.lunedì.count - 1].getDose()
        case "Martedì":
            dose = self.martedì[self.martedì.count - 1].getDose()
        case "Mercoledì":
            dose = self.mercoledì[self.mercoledì.count - 1].getDose()
        case "Giovedì":
            dose = self.giovedì[self.giovedì.count - 1].getDose()
        case "Venerdì":
            dose = self.venerdì[self.venerdì.count - 1].getDose()
        case "Sabato":
            dose = self.sabato[self.sabato.count - 1].getDose()
        default:
            dose = self.domenica[self.domenica.count - 1].getDose()
        }
        
        return dose
    }
    
    func getDose(giorno: String, indice: Int) -> String{
        var dose : String
        
        switch giorno {
        case "Lunedì":
            dose = self.lunedì[indice].getDose()
        case "Martedì":
            dose = self.martedì[indice].getDose()
        case "Mercoledì":
            dose = self.mercoledì[indice].getDose()
        case "Giovedì":
            dose = self.giovedì[indice].getDose()
        case "Venerdì":
            dose = self.venerdì[indice].getDose()
        case "Sabato":
            dose = self.sabato[indice].getDose()
        default:
            dose = self.domenica[indice].getDose()
        }
        
        return dose
    }
    
    func getCount(giorno: String) -> Int{
        var count : Int
        
        switch giorno {
        case "Lunedì":
            count = self.lunedì.count
        case "Martedì":
            count = self.martedì.count
        case "Mercoledì":
            count = self.mercoledì.count
        case "Giovedì":
            count = self.giovedì.count
        case "Venerdì":
            count = self.venerdì.count
        case "Sabato":
            count = self.sabato.count
        default:
            count = self.domenica.count
        }
        
        return count
    }
    
    func addDoseOra(giorno: String, dose: String, ora: String){
        let doseOra = DoseOra(dose: dose, ora: ora)
        
        switch giorno {
        case "Lunedì":
            self.lunedì.append(doseOra)
        case "Martedì":
            self.martedì.append(doseOra)
        case "Mercoledì":
            self.mercoledì.append(doseOra)
        case "Giovedì":
            self.giovedì.append(doseOra)
        case "Venerdì":
            self.venerdì.append(doseOra)
        case "Sabato":
            self.sabato.append(doseOra)
        default:
            self.domenica.append(doseOra)
        }
    }
    
    func getArray(giorno: String) -> [DoseOra]{
        switch giorno {
        case "Lunedì":
            return self.lunedì
        case "Martedì":
            return self.martedì
        case "Mercoledì":
            return self.mercoledì
        case "Giovedì":
            return self.giovedì
        case "Venerdì":
            return self.venerdì
        case "Sabato":
            return self.sabato
        default:
            return self.domenica
        }
    }

    func removeDoseOra(giorno: String, index: Int){
        switch giorno {
        case "Lunedì":
            self.lunedì.remove(at: index)
        case "Martedì":
            self.martedì.remove(at: index)
        case "Mercoledì":
            self.mercoledì.remove(at: index)
        case "Giovedì":
            self.giovedì.remove(at: index)
        case "Venerdì":
            self.venerdì.remove(at: index)
        case "Sabato":
            self.sabato.remove(at: index)
        default:
            self.domenica.remove(at: index)
        }
    }
}

class DoseOra{
    
    private var dose : String = String()
    private var ora : String = String()
    
    init(dose: String, ora: String) {
        self.dose = dose
        self.ora = ora
    }
    
    func getOra() -> String{
        return ora
    }
    
    func getDose() -> String{
        return dose
    }
}
