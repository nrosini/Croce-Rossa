//
//  AddFarmacoViewController.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 24/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class AddFarmacoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static var indexRow : Int = Int()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        /*print("GIORNO CELLA: ", AddFarmacoViewController.farmaco.getGiornoOra().getCount(giorno: CalendarioFarmaciCustomCell.giorno))*/
        return AddFarmacoViewController.farmaco.getGiornoOra().getCount(giorno: CalendarioFarmaciCustomCell.giorno)
        //return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellaCollectionView", for: indexPath) as! OrarioFarmaciCustomCollectionViewCell
        
        //cell.labelOra.text = AddFarmacoViewController.farmaco.getGiornoOra().getOra(giorno: CalendarioFarmaciCustomCell.giorno, indice: indexPath.item)
        
        //cell.labelDose.text = AddFarmacoViewController.farmaco.getGiornoOra().getDose(giorno: CalendarioFarmaciCustomCell.giorno, indice: indexPath.item)
        
        return cell
    }
    

    @IBOutlet var tableView: UITableView!
    static var farmaco = Farmaco()
    
    var giorniSettimana = ["Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isScrollEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name("load"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return giorniSettimana.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cellaOrarioMedicine", for: indexPath) as! CalendarioFarmaciCustomCell
        
        cell.labelGiornoSettimana.text = giorniSettimana[indexPath.item].prefix(3).uppercased()
        
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: NSIndexPath) {
        guard let tableViewCell = cell as? CalendarioFarmaciCustomCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    @objc func loadList(){
        self.tableView.reloadData()
    }

}
