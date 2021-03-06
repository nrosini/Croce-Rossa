//
//  LunTableViewCell.swift
//  CroceRossa2
//
//  Created by Nicolò Rosini on 04/09/18.
//  Copyright © 2018 Informatica_4Binf. All rights reserved.
//

import UIKit

class LunTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var labelGiorno: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        collectionView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(longTap)))
        
        
        self.collectionView.register(UINib.init(nibName: "LunCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellLun")
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadCollection), name: NSNotification.Name("loadCollection"), object: nil)
        
        
        labelGiorno.text = "LUN"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("GIORNO CELLA: ", AddFarmacoViewController.farmaco.getGiornoOra().getCount(giorno: "Lunedì"))
        return AddFarmacoViewController.farmaco.getGiornoOra().getCount(giorno: "Lunedì")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellLun", for: indexPath as IndexPath) as! LunCollectionViewCell
        
        cell.labelDose.text = AddFarmacoViewController.farmaco.getGiornoOra().getDose(giorno: "Lunedì", indice: indexPath.item)
        cell.labelOrario.text = AddFarmacoViewController.farmaco.getGiornoOra().getOra(giorno: "Lunedì", indice: indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }

    @objc func longTap(sender: UILongPressGestureRecognizer){
        
        if let indexPath = self.collectionView?.indexPathForItem(at: sender.location(in: self.collectionView)) {
            
            let cell = collectionView.cellForItem(at: indexPath) as! LunCollectionViewCell
            cell.wobble()
            
            let alert = UIAlertController(title: "Elimina Orario", message: "Vuoi veramente eliminare l'orario selezionato?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Elimina", style: .destructive, handler: {(action: UIAlertAction!) in
                AddFarmacoViewController.farmaco.getGiornoOra().removeDoseOra(giorno: "Lunedì", index: indexPath.item)
                self.collectionView.reloadData()
            })
            let alertActionCancel = UIAlertAction(title: "Annulla", style: .cancel, handler: {(action: UIAlertAction!) in
                cell.stopWobble()
                self.collectionView.reloadData()
            })
            alert.addAction(alertAction)
            alert.addAction(alertActionCancel)
            
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                if (sender.state == .began){
                    topController.present(alert, animated: true, completion: nil)
                    print("tapped")
                }
            }
            
        } else {
            print("collection view was tapped")
        }
    }
    
    @objc func loadCollection(){
        collectionView.reloadData()
    }

}
