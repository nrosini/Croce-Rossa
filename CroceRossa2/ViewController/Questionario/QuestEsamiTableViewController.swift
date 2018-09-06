//
//  QuestEsamiTableViewController.swift
//  CroceRossa2
//
//  Created by Nicolò Rosini on 06/09/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class QuestEsamiTableViewController: UITableViewController {

    //@IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(EsamiQuestTableViewCell.self, forCellReuseIdentifier: "cellEsamiQuest")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name("loadTableEsami"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Database.esami.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cella = tableView.dequeueReusableCell(withIdentifier: "cellEsamiQuest")
    
        cella?.textLabel?.text = Database.esami[indexPath.row].getNome()
        return cella!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        PopUpAddEsameViewController.esame = Database.esami[indexPath.row]
        PopUpAddEsameViewController.indexRow = indexPath.row
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "popUpEsame"), object: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            Database.esami.remove(at: indexPath.item)
            self.tableView.reloadData()
        }
    }
    
    @objc func reloadTable() {
        self.tableView.reloadData()
    }

}
