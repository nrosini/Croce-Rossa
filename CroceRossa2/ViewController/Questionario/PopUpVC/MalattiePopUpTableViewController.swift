//
//  MalattiePopUpTableViewController.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 15/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class MalattiePopUpTableViewController: UITableViewController{

    var malattie = ["Epatite", "Sifilide", "Gonorrea", "AIDS", "MARQUEZ"]
    var malattieSelezionate : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        malattieSelezionate = Database.malattie
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return malattie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = malattie[indexPath.row]
        for mal in malattieSelezionate{
            if cell.textLabel?.text == mal{
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var malattia = ""
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            
            tableView.cellForRow(at: indexPath)?.textLabel?.text
            
            malattia = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            malattieSelezionate.remove(at: malattieSelezionate.index(of: malattia)!)
            Database.malattie = malattieSelezionate
        }
            
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            
            malattia = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            malattieSelezionate.append(malattia)
            Database.malattie = malattieSelezionate
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            malattie.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
