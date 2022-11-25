//
//  FriendsCollectionViewCell.swift
//  Instagram
//
//  Created by sheikh on 11/24/22.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var bkView: UIView!
    
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var profView: UIImageView!
    
    @IBOutlet weak var lblNameView: UILabel!
    

    override func draw(_ rect: CGRect) {
       
        self.layoutIfNeeded()
        self.viewImage.layer.borderColor = UIColor(hexString: "#5148E2").cgColor
        self.viewImage.layer.borderWidth = 2
        self.viewImage.layer.cornerRadius = self.viewImage.frame.size.height/2
        self.profView.layer.cornerRadius = self.profView.frame.size.height/2
  
       
    
    }
    

}
