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
    
    let animationRotateDegres: CGFloat = 0.9
    let animationTranslateX: CGFloat = 1.4
    let animationTranslateY: CGFloat = 1.4
    let count: Int = 1
    
    func wobble() {
        let leftOrRight: CGFloat = (count % 2 == 0 ? 1 : -1)
        let rightOrLeft: CGFloat = (count % 2 == 0 ? -1 : 1)
        let leftWobble: CGAffineTransform = CGAffineTransform(rotationAngle: degreesToRadians(x: animationRotateDegres * leftOrRight))
        let rightWobble: CGAffineTransform = CGAffineTransform(rotationAngle: degreesToRadians(x: animationRotateDegres * rightOrLeft))
        let moveTransform: CGAffineTransform = leftWobble.translatedBy(x: -animationTranslateX, y: -animationTranslateY)
        let conCatTransform: CGAffineTransform = leftWobble.concatenating(moveTransform)
        
        transform = rightWobble // starting point
        UIView.animate(withDuration: 0.1, delay: 0.08, options: [.allowUserInteraction, .autoreverse, .repeat], animations: { () -> Void in
            self.transform = conCatTransform
        }, completion: nil)
    }
    
    func degreesToRadians(x: CGFloat) -> CGFloat {
        return CGFloat(Double.pi) * x / 180.0
    }
    
    func stopWobble(){
        UIView.animate(withDuration: 0, animations: { () -> Void in })
    }
}

