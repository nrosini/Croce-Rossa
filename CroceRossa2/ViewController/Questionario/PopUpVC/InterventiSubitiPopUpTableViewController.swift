//
//  InterventiSubitiPopUpTableViewController.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 23/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class InterventiSubitiPopUpTableViewController: UITableViewController {

    var interventi = ["Appendicite", "Trapianto", "Intervento al osso", "Piede monco", "Gianni Mario Fiorucci"]
    var interventiSelezionati : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interventiSelezionati = Database.interventiChirurgici
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return interventi.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = interventi[indexPath.row]
        for mal in interventiSelezionati{
            if cell.textLabel?.text == mal{
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var intervento = ""
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            
            tableView.cellForRow(at: indexPath)?.textLabel?.text
            
            intervento = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            interventiSelezionati.remove(at: interventiSelezionati.index(of: intervento)!)
            Database.interventiChirurgici = interventiSelezionati
        }
            
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            
            intervento = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            interventiSelezionati.append(intervento)
            Database.interventiChirurgici = interventiSelezionati
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            interventi.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
