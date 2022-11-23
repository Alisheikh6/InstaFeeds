//
//  SigninOneViewController.swift
//  Instagram
//
//  Created by sheikh on 10/13/22.
//

import UIKit
import MaterialComponents

class LoginViewController: UIViewController {
    
    @IBOutlet weak var btnSIgnin: UIButton!
    @IBOutlet weak var textPssword: MDCOutlinedTextField!
    @IBOutlet weak var textUserInfo: MDCOutlinedTextField!
    
    @IBAction func forgotBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpPhoneNoViewController") as! SignUpPhoneNoViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func signinBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "InstaHome", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeFeeds") as! InstaHomeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        

        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        
        btnSIgnin.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        btnSIgnin.layer.cornerRadius = 6
        
        configureTextfields()
        
    }
    
    func configureTextfields() {
        
        textUserInfo.delegate = self
        textPssword.delegate = self
        
        textUserInfo.label.text = "Username"
        textUserInfo.placeholder = "Enter your username"
        textUserInfo.setOutlineColor(UIColor(hexString: "#f0f4f5"), for: .normal)
        textUserInfo.setOutlineColor(UIColor(hexString: "#7b61FF"), for: .editing)
        textUserInfo.setTextColor(UIColor.black, for: .normal)
        textUserInfo.setFloatingLabelColor(UIColor.lightGray, for: .editing)
        
        
        textPssword.label.text = "Password"
        textPssword.placeholder = "Password"
        textPssword.setOutlineColor(UIColor(hexString: "#f0f4f5"), for: .normal)
        textPssword.setOutlineColor((UIColor(hexString: "7b61FF")), for: .editing)
        textPssword.setTextColor(UIColor.black, for: .normal)
        textPssword.setFloatingLabelColor(UIColor.lightGray, for: .editing)
        
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textUserInfo {
            textPssword.becomeFirstResponder()
            return false
        }else {
            self.view.endEditing(true)
            return false
        }
        
      
        
    }
}
