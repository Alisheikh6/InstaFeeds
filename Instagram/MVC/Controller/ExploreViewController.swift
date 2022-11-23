//
//  ExploreViewController.swift
//  Instagram
//
//  Created by sheikh on 10/12/22.
//



import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    
    @IBAction func RegisterTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func SigninTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SigninOneViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        
        btnRegister.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        btnSignIn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        
        btnRegister.layer.cornerRadius = 6
        btnSignIn.layer.cornerRadius = 6
    }

}
