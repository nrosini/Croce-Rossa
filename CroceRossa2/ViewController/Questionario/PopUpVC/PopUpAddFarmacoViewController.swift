//
//  PopUpAddFarmacoViewController.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 24/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class PopUpAddFarmacoViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var fieldDose: UITextField!
    @IBOutlet weak var segmentDose: UISegmentedControl!
    @IBOutlet weak var orario: UIDatePicker!
    
    static var dayOfWeek : String = ""
    
    var annulla: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 20
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        print(PopUpAddFarmacoViewController.dayOfWeek)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopUpMalattie(_ sender: Any) {
        if self.checkCampi(){
            self.removeAnimate()
            self.passData()
            //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadCollection"), object: nil)
        }else if !annulla{
            
            let alert = UIAlertController(title: "Immissione dei campi non completa", message: "riempire il campo descrivente la quantità di dose medicinale", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
            self.fieldDose.becomeFirstResponder()
        }
    }
    
    @IBAction func annulla(_ sender: Any) {
        self.removeAnimate()
        annulla = true
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
    
    func checkCampi() -> Bool{
        var bool = true
        if (self.fieldDose.text?.elementsEqual(""))!{
            bool = false
        }
        
        return bool
    }
    
    func passData(){
        let typeDose : String
        switch segmentDose.selectedSegmentIndex {
            case 0:
                typeDose = "mg"
                break
            case 1:
                typeDose = "ml"
                break
            case 2:
                typeDose = "cucchiai"
                break
            case 3:
                typeDose = "compresse"
                break
            default:
                typeDose = "U.I."
                break
        }
        let dose : String = fieldDose.text! + " " + typeDose
        
        CalendarioFarmaciCustomCell.giorno = PopUpAddFarmacoViewController.dayOfWeek
        
        AddFarmacoViewController.farmaco.addGiornoOra(orario: self.orario.date, giorno: PopUpAddFarmacoViewController.dayOfWeek, dose: dose)
    }
}
