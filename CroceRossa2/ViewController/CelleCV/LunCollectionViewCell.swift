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
    
    
    var leftOrRight: CGFloat = 0.0
    var rightOrLeft: CGFloat = 0.0
    var leftWobble: CGAffineTransform = CGAffineTransform()
    var rightWobble: CGAffineTransform = CGAffineTransform()
    var moveTransform: CGAffineTransform = CGAffineTransform()
    var conCatTransform: CGAffineTransform = CGAffineTransform()
    
    func wobble() {
        leftOrRight = (count % 2 == 0 ? 1 : -1)
        rightOrLeft = (count % 2 == 0 ? -1 : 1)
        leftWobble = CGAffineTransform(rotationAngle: degreesToRadians(x: animationRotateDegres * leftOrRight))
        rightWobble = CGAffineTransform(rotationAngle: degreesToRadians(x: animationRotateDegres * rightOrLeft))
        moveTransform = leftWobble.translatedBy(x: -animationTranslateX, y: -animationTranslateY)
        conCatTransform = leftWobble.concatenating(moveTransform)
        
        transform = rightWobble // starting point
        UIView.animate(withDuration: 0.1, delay: 0.08, options: [.allowUserInteraction, .autoreverse, .repeat], animations: { () -> Void in
            self.transform = self.conCatTransform
        }, completion: nil)
    }
    
    func degreesToRadians(x: CGFloat) -> CGFloat {
        return CGFloat(Double.pi) * x / 180.0
    }
    
    func stopWobble(){
        UIView.animate(withDuration: 0, animations: { () -> Void in })
        transform = rightWobble
    }
}

