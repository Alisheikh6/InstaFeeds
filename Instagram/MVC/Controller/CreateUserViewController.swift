//
//  CreateUserViewController.swift
//  Instagram
//
//  Created by sheikh on 10/21/22.
//

import UIKit
import MaterialComponents

class CreateUserViewController: UIViewController {
    
    @IBOutlet weak var ContinueBtn: UIButton!
    @IBOutlet weak var txtUsername: MDCOutlinedTextField!
    @IBOutlet weak var constraintBottomFinishBtn: NSLayoutConstraint!
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        
        if Validation.validateUsername(username: txtUsername.text!) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "CreateEmailViewController") as! CreateEmailViewController
            navigationController?.pushViewController(vc, animated: true)
//            let alert = UIAlertController(title: "Congrats", message: "You have successfully registered a username", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//            self.navigationController?.popToRootViewController(animated: true)
        }else {
            let alert = UIAlertController(title: "Sorry", message: "Your Username must be grater than 7", preferredStyle: .alert)
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
        txtUsername.becomeFirstResponder()
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
        
        ContinueBtn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        ContinueBtn.layer.cornerRadius = 8
        
        configureTxtFields()
        
    }
    
    func configureTxtFields() {
        
        let check = UIButton(type: .custom)
        
        check.frame =  CGRect(x: 0, y: 0, width: txtUsername.frame.height, height: txtUsername.frame.height)
        check.setImage(UIImage(named: "checkmark"), for: .normal)
        
        txtUsername.label.text = "Username"
        txtUsername.placeholder = "Username"
        txtUsername.setOutlineColor(UIColor(hexString: "#f0f4f5"), for: .normal)
        txtUsername.setOutlineColor(UIColor(hexString: "#7b61FF"), for: .editing)
        txtUsername.setTextColor(UIColor.black, for: .normal)
        txtUsername.setFloatingLabelColor(UIColor.lightGray, for: .editing)
        txtUsername.trailingView?.isUserInteractionEnabled = false
        txtUsername.trailingView = check
        txtUsername.trailingViewMode = .always
        
        
    }
    
    func disableButton() {
        self.ContinueBtn.layer.opacity = 0.3
        self.ContinueBtn.isUserInteractionEnabled = false
    }
    
    func enableButton(){
        self.ContinueBtn.layer.opacity = 1
        self.ContinueBtn.isUserInteractionEnabled = true
    }
    
    
    @objc func textfieldDidChange(_ textfield:UITextField){
        if textfield.text!.count > 3 {
            enableButton()
        }else{
            disableButton()
        }
    }
        
    @objc func keyboardWillShow(_ notification: Notification) {
            print("Keyboard show 2")
            if let userInfo = notification.userInfo {
                if let keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    UIView.animate(withDuration: 2) {
                        self.constraintBottomFinishBtn.constant = keyboardFrame.size.height + 10
                        self.view.layoutIfNeeded()
                    }
                }
            }
        }
        
    @objc func keyboardWillHide(_ notifcation: Notification) {
            print("Keyboard hide 2")
            UIView.animate(withDuration: 2) {
                self.constraintBottomFinishBtn.constant = 20
                self.view.layoutIfNeeded()
            }
        }
}
