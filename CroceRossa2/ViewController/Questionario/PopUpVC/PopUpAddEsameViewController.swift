//
//  PopUpAddEsameViewController.swift
//  CroceRossa2
//
//  Created by Nicolò Rosini on 06/09/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class PopUpAddEsameViewController: UIViewController {

    @IBOutlet weak var fieldNome: UITextField!
    @IBOutlet weak var pickerOrarioEsame: UIDatePicker!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var buttonAnnulla: UIView!
    @IBOutlet weak var buttonElimina: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    static var esame = Esame()
    static var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.cornerRadius = 20

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        
        buttonAnnulla.isHidden = true
        buttonElimina.isHidden = true
        updateButton.isHidden = true
        addButton.isHidden = false
        
        if(PopUpAddEsameViewController.esame.getNome() != ""){
            fieldNome.text = PopUpAddEsameViewController.esame.getNome()
            pickerOrarioEsame.date = PopUpAddEsameViewController.esame.getOra()
            buttonAnnulla.isHidden = false
            buttonElimina.isHidden = false
            updateButton.isHidden = false
            addButton.isHidden = true
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    @IBAction func confermaEsame(_ sender: Any) {
        if self.checkCampi() {
            PopUpAddEsameViewController.esame.setNome(nome: self.fieldNome.text!)
            PopUpAddEsameViewController.esame.setOra(ora: self.pickerOrarioEsame.date)
            
            Database.esami.append(PopUpAddEsameViewController.esame)
            
            PopUpAddEsameViewController.esame = Esame()

            for es in Database.esami {
                print(es.getNome())
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadTableEsami"), object: nil)
            
            self.removeAnimate()
        }else{
            
            let alert = UIAlertController(title: "Immissione dei campi non completa", message: "riempire il campo descrivente il nome del esame", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
            self.fieldNome.becomeFirstResponder()
        }
    }
    
    @IBAction func annulla(_ sender: Any) {
        self.removeAnimate()
    }
    
    @IBAction func elimina(_ sender: Any) {
        Database.esami.remove(at: PopUpAddEsameViewController.indexRow)
        self.removeAnimate()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadTableEsami"), object: nil)
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if checkCampi(){
            PopUpAddEsameViewController.esame.setNome(nome: self.fieldNome.text!)
            PopUpAddEsameViewController.esame.setOra(ora: self.pickerOrarioEsame.date)
            
            Database.esami[PopUpAddEsameViewController.indexRow] = PopUpAddEsameViewController.esame
            
            PopUpAddEsameViewController.esame = Esame()
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadTableEsami"), object: nil)
            
            self.removeAnimate()
        }
    }
    
    func checkCampi() -> Bool{
        var bool = true
        if (self.fieldNome.text?.elementsEqual(""))!{
            bool = false
        }
        return bool
    }
}
