//
//  WelcomeTwoViewController.swift
//  Instagram
//
//  Created by sheikh on 10/18/22.
//

import UIKit
import MaterialComponents

class OTPViewController: UIViewController {
    
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var txtfieldOne: MDCOutlinedTextField!
    @IBOutlet weak var txtfieldTwo: MDCOutlinedTextField!
    @IBOutlet weak var txtfieldThree: MDCOutlinedTextField!
    @IBOutlet weak var txtfieldFour: MDCOutlinedTextField!
    
    @IBOutlet weak var constraintBottomBtn: NSLayoutConstraint!
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldThree: UITextField!
    @IBOutlet weak var textFieldFour: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        
        guard let firstCode = txtfieldOne.text else { return }
        guard let secCode = txtfieldTwo.text else { return }
        guard let thirdCode = textFieldThree.text else { return }
        guard let forthCode = textFieldFour.text else { return }
        
        let otpCode = "\(firstCode)\(secCode)\(thirdCode)\(forthCode)"
//        let otpCode = firstCode + secCode + thirdCode + forthCode
        
        if otpCode.count < 4 { return }
        
        print(" MY OTP CODE: \(otpCode)")
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreatePasswordViewController") as! CreatePasswordViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        textFieldOne.keyboardType = .numberPad
        textFieldTwo.keyboardType = .numberPad
        textFieldThree.keyboardType = .numberPad
        textFieldFour.keyboardType = .numberPad
        
        configureUI()
        disableButton()
        addObserversForKeyboard()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textFieldOne.becomeFirstResponder()
    }

    
    deinit{
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    func configureUI() {
        
        continueBtn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        continueBtn.layer.cornerRadius = 8
        let hasNotch = UIDevice.current.hasNotch
        self.constraintBottomBtn.constant = hasNotch ? 271 : 196
        configureTextfields()
    }
    
    func addObserversForKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    
    
    func configureTextfields() {
        
        txtfieldOne.setOutlineColor(UIColor(hexString: "#aab1b3"), for: .normal)
        txtfieldOne.setOutlineColor(UIColor(hexString: "#7b61FF"), for: .editing)
        txtfieldOne.setTextColor(UIColor.black, for: .normal)
        
        txtfieldTwo.setOutlineColor(UIColor(hexString: "#aab1b3"), for: .normal)
        txtfieldTwo.setOutlineColor(UIColor(hexString: "#7b61FF"), for: .editing)
        txtfieldTwo.setTextColor(UIColor.black, for: .normal)
        
        txtfieldThree.setOutlineColor(UIColor(hexString: "#aab1b3"), for: .normal)
        txtfieldThree.setOutlineColor(UIColor(hexString: "#7b61FF"), for: .editing)
        txtfieldThree.setTextColor(UIColor.black, for: .normal)
        
        txtfieldFour.setOutlineColor(UIColor(hexString: "#aab1b3"), for: .normal)
        txtfieldFour.setOutlineColor(UIColor(hexString: "#7b61FF"), for: .editing)
        txtfieldFour.setTextColor(UIColor.black, for: .normal)
        
        txtfieldOne.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtfieldTwo.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtfieldThree.addTarget(self, action: #selector(textFieldDidChange(_: )), for: .editingChanged)
        txtfieldFour.addTarget(self, action: #selector(textFieldDidChange(_: )), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text
        
        if text?.count == 1{
            
            switch textField {
            case textFieldOne:
                print("1")
                self.textFieldTwo.becomeFirstResponder()
                if textFieldOne.text?.count == 1 && textFieldTwo.text?.count == 1  && textFieldThree.text?.count == 1 && textFieldFour.text?.count == 1 {
                    enableButton()
                }
            case textFieldTwo:
                print("2")
                self.textFieldThree.becomeFirstResponder()
                if textFieldOne.text?.count == 1 && textFieldTwo.text?.count == 1  && textFieldThree.text?.count == 1 && textFieldFour.text?.count == 1 {
                    enableButton()
                }
            case textFieldThree:
                print("3")
                self.textFieldFour.becomeFirstResponder()
                if textFieldOne.text?.count == 1 && textFieldTwo.text?.count == 1  && textFieldThree.text?.count == 1 && textFieldFour.text?.count == 1 {
                    enableButton()
                }
            case textFieldFour:
                print("4")
                
                if textFieldOne.text?.count == 1 && textFieldTwo.text?.count == 1  && textFieldThree.text?.count == 1 && textFieldFour.text?.count == 1 {
                    enableButton()
                }
//                self.textFieldFour.resignFirstResponder()
                self.textFieldFour.becomeFirstResponder()
            default:
                break
            }
            
          
        }
        
        if text?.count == 0 {
            switch textField {
            case textFieldOne:
                print("1")
                self.textFieldOne.becomeFirstResponder()
                disableButton()
            case textFieldTwo:
                print("2")
                self.textFieldOne.becomeFirstResponder()
                disableButton()
            case textFieldThree:
                print("3")
                self.textFieldTwo.becomeFirstResponder()
                disableButton()
            case textFieldFour:
                print("4")
                self.textFieldThree.becomeFirstResponder()
                disableButton()
             
            default:
                break
            }
        }
      
    }
    
    func disableButton() {
        self.continueBtn.layer.opacity = 0.3
        self.continueBtn.isUserInteractionEnabled = false
    }
    
    func enableButton(){
        self.continueBtn.layer.opacity = 1
        self.continueBtn.isUserInteractionEnabled = true
    }
    
    

    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("Keyboard Will show METHOD cALLED")
        if let userInfo = notification.userInfo {
            if let keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//                let fram = self.view.convert(keyboardFrame, from: nil)
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.5) {
                        let hasNotch = UIDevice.current.hasNotch
                        self.constraintBottomBtn.constant = hasNotch ? keyboardFrame.size.height - 20 : keyboardFrame.size.height + 10
                        print(keyboardFrame.size.height - 20)
                        self.view.layoutIfNeeded()
                    }
                }
              
                
            }
        }
    }
    
    @objc func keyboardWillHide(_ notifcation: Notification) {
        print("Keyboard Will Hide METHOD Called")
        UIView.animate(withDuration: 0.5) {
            self.constraintBottomBtn.constant = 20
            self.view.layoutIfNeeded()
        }
      
    }
}


