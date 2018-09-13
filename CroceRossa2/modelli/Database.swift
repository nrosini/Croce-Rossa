//
//  Database.swift
//  CroceRossa2
//
//  Created by Informatica on 07/05/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import Foundation
import SQLite3

class Database{
    
    var db: OpaquePointer? = nil
    var puntatore: OpaquePointer? = nil
    
    static var sesso = String()
    static var birthDay = Date()
    
    static var nome = String()
    static var cognome = String()
    static var email = String()
    static var provincia = String()
    static var citta = String()
    static var indirizzo = String()
    static var cap = String()
    static var password = String()
    static var phone = String()
    
    static var malattie: [String] = []
    static var interventiChirurgici: [String] = []
    static var allergie: [String] = []
    static var farmaci: [Farmaco] = [Farmaco]()
    static var esami: [Esame] = [Esame]()
    
    //costruttore con connessione al db
    init(){
        if sqlite3_open("/Users/admin_6150/Desktop/CroceRossa2provacopia/Data.db", &db) == SQLITE_OK{
            print("Collegamento database ok")
        }
        else{
            print("errore collegamento database")
        }
    }
    
    
    // passaggio dati immessi(nome, password)
    func login(username: NSString, passw: NSString) {
        print(passw)
        print(username)
        
        let insert = "INSERT INTO dati(username, password) VALUES(?,?)"
        
        if sqlite3_prepare(db, insert, -1, &puntatore, nil) != SQLITE_OK{
        }
        
        if sqlite3_bind_text(puntatore, 1, username.utf8String, -1, nil) != SQLITE_OK{
            print("errore salvataggio username")
        }
        if sqlite3_bind_text(puntatore, 2, passw.utf8String, -1, nil) != SQLITE_OK{
            print("errore salvataggio passsword")
        }
        
        if sqlite3_step(puntatore) == SQLITE_DONE{
            print("salvatagggio effettuato")
        }
        else{
            print("salvataggio non riuscito")
        }
    }

    
}

