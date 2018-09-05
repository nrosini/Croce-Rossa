//
//  AddFarmacoViewController.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 24/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//
import UIKit

class AddFarmacoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static var indexRow : Int = Int()
    
    @IBOutlet weak var fieldNome: UITextField!
    @IBOutlet weak var fieldPrinicipio: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var updateButton: UIButton!
    
    static var farmaco = Farmaco()
    
    var giorniSettimana = ["Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if AddFarmacoViewController.farmaco.getNome().elementsEqual("") {
            updateButton.isHidden = true
        }
        
        self.tableView.isScrollEnabled = false
        
        let nibNameLun = UINib(nibName: "LunTableViewCell", bundle: nil)
        tableView.register(nibNameLun, forCellReuseIdentifier: "cellLunedì")
        let nibNameMar = UINib(nibName: "MarTableViewCell", bundle: nil)
        tableView.register(nibNameMar, forCellReuseIdentifier: "cellMartedì")
        let nibNameMer = UINib(nibName: "MerTableViewCell", bundle: nil)
        tableView.register(nibNameMer, forCellReuseIdentifier: "cellMercoledì")
        let nibNameGio = UINib(nibName: "GioTableViewCell", bundle: nil)
        tableView.register(nibNameGio, forCellReuseIdentifier: "cellGiovedì")
        let nibNameVen = UINib(nibName: "VenTableViewCell", bundle: nil)
        tableView.register(nibNameVen, forCellReuseIdentifier: "cellVenerdì")
        let nibNameSab = UINib(nibName: "SabTableViewCell", bundle: nil)
        tableView.register(nibNameSab, forCellReuseIdentifier: "cellSabato")
        let nibNameDom = UINib(nibName: "DomTableViewCell", bundle: nil)
        tableView.register(nibNameDom, forCellReuseIdentifier: "cellDomenica")
        
        if(AddFarmacoViewController.farmaco.getNome() != ""){
            fieldNome.text = AddFarmacoViewController.farmaco.getNome()
            fieldPrinicipio.text = AddFarmacoViewController.farmaco.getPrincipio()
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return giorniSettimana.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        
        switch indexPath.item {
        case 0:
             cell = self.tableView.dequeueReusableCell(withIdentifier: "cellLunedì", for: indexPath) as! LunTableViewCell
        case 1:
             cell = self.tableView.dequeueReusableCell(withIdentifier: "cellMartedì", for: indexPath) as! MarTableViewCell
        case 2:
             cell = self.tableView.dequeueReusableCell(withIdentifier: "cellMercoledì", for: indexPath) as! MerTableViewCell
        case 3:
             cell = self.tableView.dequeueReusableCell(withIdentifier: "cellGiovedì", for: indexPath) as! GioTableViewCell
        case 4:
             cell = self.tableView.dequeueReusableCell(withIdentifier: "cellVenerdì", for: indexPath) as! VenTableViewCell
        case 5:
             cell = self.tableView.dequeueReusableCell(withIdentifier: "cellSabato", for: indexPath) as! SabTableViewCell
        default:
             cell = self.tableView.dequeueReusableCell(withIdentifier: "cellDomenica", for: indexPath) as! DomTableViewCell
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        PopUpAddFarmacoViewController.dayOfWeek = self.giorniSettimana[indexPath.item]
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpAddFarmacoID") as! PopUpAddFarmacoViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    @IBAction func insertButton(_ sender: Any) {
        
        if self.checkCampi(){
            AddFarmacoViewController.farmaco.setNome(nome: fieldNome.text!)
            AddFarmacoViewController.farmaco.setPrinicipio(principio: fieldPrinicipio.text!)
            Database.farmaci.append(AddFarmacoViewController.farmaco)
            
            AddFarmacoViewController.farmaco = Farmaco()
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "Questionario") as! QuestViewController
            present(controller, animated: true, completion: nil)
        }else {
            
            let alert = UIAlertController(title: "Immissione dei campi non completa", message: "riempire tutti i campi", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
            if(self.fieldNome.text?.elementsEqual(""))!{
                self.fieldNome.becomeFirstResponder()
            } else if (self.fieldPrinicipio.text?.elementsEqual(""))!{
                self.fieldPrinicipio.becomeFirstResponder()
            }
        }
    }
    
    @IBAction func buttonUpdate(_ sender: Any) {
        AddFarmacoViewController.farmaco.setNome(nome: fieldNome.text!)
        AddFarmacoViewController.farmaco.setPrinicipio(principio: fieldPrinicipio.text!)
        
        Database.farmaci[AddFarmacoViewController.indexRow] = AddFarmacoViewController.farmaco
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "Questionario") as! QuestViewController
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        AddFarmacoViewController.farmaco = Farmaco()
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "Questionario") as! QuestViewController
        present(controller, animated: true, completion: nil)
    }

    
    func checkCampi() -> Bool{
        var bool = true
        if ((self.fieldNome.text?.elementsEqual(""))! || (self.fieldPrinicipio.text?.elementsEqual(""))!){
            bool = false
        }
        
        return bool
    }

}
