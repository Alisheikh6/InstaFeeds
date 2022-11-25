//
//  InstaHomeViewController.swift
//  Instagram
//
//  Created by sheikh on 11/17/22.
//

import UIKit

class InstaHomeViewController: UIViewController {
    
    
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    @IBOutlet weak var viewNotification: UIButton!
    
    @IBAction func addBtnTapped(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
}

extension InstaHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 99
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FriendsCollectionViewCell
        let addcell = collectionView.dequeueReusableCell(withReuseIdentifier: "Addcell", for: indexPath) as! AddFriendsCollectionViewCell
        
        if indexPath.item == 0 {
            return addcell
        }else {
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
}
