//
//  QuestViewController.swift
//  CroceRossa2
//
//  Created by Informatica on 23/04/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var labelMalattie: UILabel!
    @IBOutlet weak var labelInterventi: UILabel!
    @IBOutlet weak var labelAllergie: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var tableViewFarmaci: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewFarmaci.dataSource = self
        self.tableViewFarmaci.delegate = self
        textField.layer.borderWidth = CGFloat(Float(0.7))
        textField.layer.cornerRadius = CGFloat(Float(5.0))
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(malattieField), name: NSNotification.Name("loadMalattie"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(interventiField), name: NSNotification.Name("loadInterventi"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(allergieField), name: NSNotification.Name("loadAllergie"), object: nil)
    }
    
    
    @IBAction func showPopUpMalattie(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpMalattieID") as! PopUpMalattieViewController;
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func showPopUpInterventiChirurgici(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpInterventiSubitiID") as! PopUpInterventiSubitiViewController;        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func showPopUpAllergie(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpAllergieID") as! PopUpAllergieViewController;        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
  
    @objc func malattieField(){
        if Database.malattie.isEmpty{
            labelMalattie.text = "Nessuna malattia selezionata"
        }
        else {
            labelMalattie.text = Database.malattie.joined(separator: ", ")
        }
    }
    
    @objc func interventiField(){
        if Database.interventiChirurgici.isEmpty{
            labelInterventi.text = "Nessun'intervento selezionato"
        }
        else {
            labelInterventi.text = Database.interventiChirurgici.joined(separator: ", ")
        }
        
    }
    
    @objc func allergieField(){
        if Database.allergie.isEmpty{
            labelAllergie.text = "Nessun'allergia selezionata"
        }
        else {
            labelAllergie.text = Database.allergie.joined(separator: ", ")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return Database.farmaci.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewFarmaci.dequeueReusableCell(withIdentifier: "cellFarmaciQuest") as! FarmaciQuestTableViewCell
        
        cell.initLabel(nome: Database.farmaci[indexPath.item].getNome(), principio: Database.farmaci[indexPath.item].getPrincipio())
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AddFarmacoViewController.farmaco = Database.farmaci[indexPath.item]
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "addFarmacoVCID") as! AddFarmacoViewController
        present(controller, animated: true, completion: nil)
        
        AddFarmacoViewController.indexRow = indexPath.item
        
    }
    
}
