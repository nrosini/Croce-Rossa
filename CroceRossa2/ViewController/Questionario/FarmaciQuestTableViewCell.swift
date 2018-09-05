//
//  FarmaciQuestTableViewCell.swift
//  CroceRossa2
//
//  Created by Nicolò Rosini on 04/09/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class FarmaciQuestTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelPrinicipio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initLabel(nome: String, principio: String) {
        labelNome.text = nome
        labelPrinicipio.text = principio
    }
}
