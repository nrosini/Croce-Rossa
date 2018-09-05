//
//  MarTableViewCell.swift
//  CroceRossa2
//
//  Created by Nicolò Rosini on 04/09/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class MarTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var labelGiorno: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib.init(nibName: "LunCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellLun")
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadCollection), name: NSNotification.Name("loadCollection"), object: nil)
        
        labelGiorno.text = "MAR"
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("GIORNO CELLA: ", AddFarmacoViewController.farmaco.getGiornoOra().getCount(giorno: "Martedì"))
        return AddFarmacoViewController.farmaco.getGiornoOra().getCount(giorno: "Martedì")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellLun", for: indexPath as IndexPath) as! LunCollectionViewCell
        
        cell.labelDose.text = AddFarmacoViewController.farmaco.getGiornoOra().getDose(giorno: "Martedì", indice: indexPath.item)
        cell.labelOrario.text = AddFarmacoViewController.farmaco.getGiornoOra().getOra(giorno: "Martedì", indice: indexPath.item)
        
        return cell
    }
    
    @objc func loadCollection(){
        collectionView.reloadData()
    }
    
}
