//
//  LunCollectionViewCell.swift
//  CroceRossa2
//
//  Created by Nicolò Rosini on 04/09/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class LunCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelDose: UILabel!
    
    @IBOutlet weak var labelOrario: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }

}
