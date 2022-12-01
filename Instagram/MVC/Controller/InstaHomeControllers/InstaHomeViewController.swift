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
    
    var friends: [Friends] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

       getFriends()
    }
    
    func getFriends(){
        guard let placeHolderImage = UIImage(named: "Profile1") else { return }
        
        friends.append(Friends(name: "",image: UIImage(named: "") ?? placeHolderImage , id: "add"))
        friends.append(Friends(name: "Ali",image: UIImage(named: "man") ?? placeHolderImage , id: "1"))
        friends.append(Friends(name: "Ahmad", image: UIImage(named: "man-1") ?? placeHolderImage , id: "2"))
        friends.append(Friends(name: "yunas",image: UIImage(named: "man-2") ?? placeHolderImage , id: "3"))
        friends.append(Friends(name: "waqas", image: UIImage(named: "man-2") ?? placeHolderImage , id: "4"))
        friends.append(Friends(name: "jams",image: UIImage(named: "man-3") ?? placeHolderImage , id: "5"))
        friends.append(Friends(name: "joked", image: UIImage(named: "man-4") ?? placeHolderImage , id: "6"))
        friends.append(Friends(name: "saxrf",image: UIImage(named: "man") ?? placeHolderImage , id: "7"))
        friends.append(Friends(name: "vcsdf", image: UIImage(named: "man-1") ?? placeHolderImage , id: "8"))
    }

 
}

extension InstaHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == friendsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.friendCell.rawValue, for: indexPath) as! FriendsCollectionViewCell
            let addcell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.addFriendCell.rawValue, for: indexPath) as! AddFriendsCollectionViewCell
            
        
            cell.profView.image = friends[indexPath.item].image
            cell.lblNameView.text = friends[indexPath.item].name
            
            if indexPath.item == 0 {
                return addcell
            }else {
                return cell
            }
        }else {
            
        // TO DO: do the let cell code here after you implement the new collectionView. Return the new collection view cell not this one
          return UICollectionViewCell()
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item)
        print(friends[indexPath.row].id)
        print(friends[indexPath.item].name)
        let name = friends[indexPath.item].name
        let id = friends[indexPath.row].id
        
        let alert = UIAlertController(title: "Friend", message: "Hello My Name is \(name) and my id is \(id)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
}
