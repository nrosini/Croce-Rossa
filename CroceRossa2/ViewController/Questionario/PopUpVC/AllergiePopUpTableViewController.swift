//
//  AllergiePopUpTableViewController.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 23/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class AllergiePopUpTableViewController: UITableViewController {

    var allergie = ["Arachidi", "Polline", "Lattosio", "Graminacee", "Acaro"]
    var allergieSelezionate : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allergieSelezionate = Database.allergie
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return allergie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = allergie[indexPath.row]
        for mal in allergieSelezionate{
            if cell.textLabel?.text == mal{
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var allergia = ""
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            
            tableView.cellForRow(at: indexPath)?.textLabel?.text
            
            allergia = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            allergieSelezionate.remove(at: allergieSelezionate.index(of: allergia)!)
            Database.allergie = allergieSelezionate
        }
            
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            
            allergia = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            allergieSelezionate.append(allergia)
            Database.allergie = allergieSelezionate
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            allergie.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
