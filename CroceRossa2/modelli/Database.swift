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
    static var malattie: [String] = []
    static var interventiChirurgici: [String] = []
    static var allergie: [String] = []
    static var farmaci: [Farmaco] = [Farmaco]()
    
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
    

    /*func register(cogn: NSString, nome: NSString, sesso: NSString){
        
        let insert = "INSERT INTO dati(nome, cognome, sesso) VALUES(?,?,?)"
        
        if sqlite3_prepare(db, insert, -1, &puntatore, nil) != SQLITE_OK{}
        
        if sqlite3_bind_text(puntatore, 1, nome.utf8String, -1, nil) != SQLITE_OK{
            print("errore salvataggio nome")
        }
        
        if sqlite3_bind_text(puntatore, 2, cogn.utf8String, -1, nil) != SQLITE_OK{
            print("errore salvataggio cognome")
        }
        
        if sqlite3_bind_text(puntatore, 3, sesso.utf8String, -1, nil) != SQLITE_OK{
            print("errore salvataggio sesso")
        }
        
        if sqlite3_step(puntatore) == SQLITE_DONE{
            print("salvatagggio effettuato")
        }
        else{
            print("salvataggio non riuscito")
        }*/
        
        /*var puntatore: OpaquePointer? = nil
        let insert = "INSERT INTO dati(nome, cognome) VALUES(?,?)"
        
        if sqlite3_prepare(db, insert, -1, &puntatore, nil) != SQLITE_OK{
        }
        
    }*/
    
}


/*
 ricerca all'interno del database
 let queryString = "SELECT * FROM dati"
 var punt:OpaquePointer?
 
 //chiamata
 if sqlite3_prepare(db, queryString, -1, &punt, nil) == SQLITE_OK{
 if sqlite3_step(punt) == SQLITE_ROW{
 //prende valori dal database
 let nome = String(cString: sqlite3_column_text(punt, 0))
 print(nome)
 
 }
 }
 
 sqlite3_finalize(punt)*/

