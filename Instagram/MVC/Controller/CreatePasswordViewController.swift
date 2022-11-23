//
//  CreatePasswordViewController.swift
//  Instagram
//
//  Created by sheikh on 10/21/22.
//

import UIKit
import MaterialComponents

class CreatePasswordViewController: UIViewController {
    
    
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var txtPassword: MDCOutlinedTextField!
    
    
    @IBOutlet weak var constraintBottomContBtn: NSLayoutConstraint!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        
        if Validation.validatePassword(pass: txtPassword.text!) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "CreateUserViewController") as! CreateUserViewController
            navigationController?.pushViewController(vc, animated: true)
        }else {
            let alert = UIAlertController(title: "Sorry", message: "Your passwrod must be grater than 8", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
        }
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        disableButton()
        addKeyboardObserver()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtPassword.becomeFirstResponder()
    }

    
    deinit{
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func configureUI() {
        
        continueBtn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        continueBtn.layer.cornerRadius = 8
        
        configureTextFields()
        
        
    }
    
    
    func configureTextFields() {
        
        let password = UIButton(type: .custom)
        
        password.frame =  CGRect(x: 0, y: 0, width: txtPassword.frame.height, height: txtPassword.frame.height)
        password.setImage(UIImage(named: "Hide"), for: .normal)
        password.setImage(UIImage(named: "Show"), for: .selected)
        password.addTarget(self, action: #selector(showPassword(sender:)), for: .touchUpInside)
        
        txtPassword.label.text = "Password"
        txtPassword.placeholder = "Password"
        txtPassword.isSecureTextEntry = true
        txtPassword.setOutlineColor(UIColor(hexString: "#f0f4f5"), for: .normal)
        txtPassword.setOutlineColor((UIColor(hexString: "#7b61FF")), for: .editing)
        txtPassword.setTextColor(UIColor.black, for: .normal)
        txtPassword.setFloatingLabelColor(UIColor.lightGray, for: .editing)
        txtPassword.trailingView?.isUserInteractionEnabled = false
        txtPassword.trailingView = password
        txtPassword.trailingViewMode = .always
        
    }
    
    func disableButton() {
        self.continueBtn.layer.opacity = 0.3
        self.continueBtn.isUserInteractionEnabled = false
    }
    
    func enableButton(){
        self.continueBtn.layer.opacity = 1
        self.continueBtn.isUserInteractionEnabled = true
    }
    
    
    @objc func textfieldDidChange(_ textfield:UITextField){
        if textfield.text!.count > 8 {
            enableButton()
        }else{
            disableButton()
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("Keyboard show")
        if let userInfo = notification.userInfo {
            if let keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                UIView.animate(withDuration: 2) {
                
                    let hasNotch = UIDevice.current.hasNotch
                    self.constraintBottomContBtn.constant = hasNotch ? keyboardFrame.size.height - 20 : keyboardFrame.size.height + 10
                    print(keyboardFrame.size.height - 20)
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc func keyboardWillHide(_ notifcation: Notification) {
        print("Keyboard hide")
        UIView.animate(withDuration: 2) {
            self.constraintBottomContBtn.constant = 20
            self.view.layoutIfNeeded()
        }
      
    }
    
    
    @objc func showPassword(sender:UIButton) {
        
        sender.isSelected.toggle()
        
        if sender.isSelected == true {
            txtPassword.isSecureTextEntry = false
        }else {
            txtPassword.isSecureTextEntry = true
        }
       
    }
    
    

}
