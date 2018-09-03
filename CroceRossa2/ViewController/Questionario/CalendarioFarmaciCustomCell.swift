//
//  CalendarioFarmaciCustomCell.swift
//  CroceRossa2
//
//  Created by Admin_6150 on 24/07/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class CalendarioFarmaciCustomCell: UITableViewCell{

    @IBOutlet var labelGiornoSettimana: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var giorno : String = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionView), name: NSNotification.Name("loadCollection"), object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func reloadCollectionView(){
        print("CADAVERE")
        self.collectionView.reloadData()
    }

}

extension CalendarioFarmaciCustomCell {
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        //collectionView.tag = row
        collectionView.reloadData()
    }
    
}
