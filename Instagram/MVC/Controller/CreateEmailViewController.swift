//
//  CreateEmailViewController.swift
//  Instagram
//
//  Created by sheikh on 11/8/22.
//

import UIKit
import MaterialComponents

class CreateEmailViewController: UIViewController {
    
    @IBOutlet weak var finishBtn: UIButton!
    
    @IBOutlet weak var txtEmail: MDCOutlinedTextField!
    
    @IBOutlet weak var finishBtnBottomConstraint: NSLayoutConstraint!
    
    @IBAction func finishBtnPressed(_ sender: UIButton) {
        
        
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
        txtEmail.becomeFirstResponder()
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
        
        finishBtn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        finishBtn.layer.cornerRadius = 8
        
    }
    
    func disableButton() {
        self.finishBtn.layer.opacity = 0.3
        self.finishBtn.isUserInteractionEnabled = false
    }
    
    func enableButton(){
        self.finishBtn.layer.opacity = 1
        self.finishBtn.isUserInteractionEnabled = true
    }
    
    
    @objc func textfieldDidChange(_ textfield:UITextField){
        if textfield.text!.count > 5 {
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
                    self.finishBtnBottomConstraint.constant = keyboardFrame.size.height + 10
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc func keyboardWillHide(_ notifcation: Notification) {
        print("Keyboard hide 2")
        UIView.animate(withDuration: 2) {
            self.finishBtnBottomConstraint.constant = 20
            self.view.layoutIfNeeded()
        }
    }
    
}
