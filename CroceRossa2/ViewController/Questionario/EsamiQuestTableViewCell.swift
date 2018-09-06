//
//  EsamiQuestTableViewCell.swift
//  CroceRossa2
//
//  Created by Nicolò Rosini on 06/09/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class EsamiQuestTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelOra: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initLabel(nome: String, ora: Date) {
        self.labelNome.text = nome
        self.labelOra.text = ora.description
    }
}
