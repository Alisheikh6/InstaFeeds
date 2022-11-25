//
//  AddFriendsCollectionViewCell.swift
//  Instagram
//
//  Created by sheikh on 11/25/22.
//

import UIKit

class AddFriendsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var title: UILabel!
    
    
    
    override func draw(_ rect: CGRect) {
        self.viewImage.addLineDashedStroke(pattern: [6, 6], radius:  self.viewImage.frame.size.height/2, color: UIColor(hexString: "#5148E2").cgColor)
        self.viewImage.layer.cornerRadius = self.viewImage.frame.size.height/2
        self.image.layer.cornerRadius = self.image.frame.size.height/2
        self.layoutIfNeeded()

        
    }
    
    
}
