//
//  WelcomeViewController.swift
//  Instagram
//
//  Created by sheikh on 10/14/22.
//

import UIKit
import MaterialComponents
import CountryPickerView

class SignUpPhoneNoViewController: UIViewController {
  
    
    @IBOutlet weak var constraintBottomContinueBtn: NSLayoutConstraint! // Default 20
    @IBOutlet weak var contiueBtn: UIButton!
    @IBOutlet weak var signupBtn: UILabel!
    
    @IBOutlet weak var txtfieldMobile: MDCOutlinedTextField!
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
       
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        
        guard let phoneNo = txtfieldMobile.text else { return }
        guard let phoneCode = userPhoneCode else { return }
        userPhoneNo = phoneNo
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    let countryPicker = CountryPickerView()
    var flagButton:UIButton? = nil
    var userPhoneNo: String? = nil
    var userPhoneCode: String? = nil
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPicker.delegate = self
        
        configureUI()
        disableButton()
        getUserLocaleInfo()
        addObserversForKeyboard()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtfieldMobile.becomeFirstResponder()
    }
    
    
    deinit{
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    func addObserversForKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func configureUI() {
        contiueBtn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        contiueBtn.layer.cornerRadius = 8
        
        configureTextFields()
    }
    
    func getUserLocaleInfo() {
        let locale = Locale.current
        if #available(iOS 16, *) {
            print(locale.region)
        } else {
            // Fallback on earlier versions
        }
        print(locale.regionCode)
        flagButton?.setImage(UIImage(named: locale.regionCode ?? "AF"), for: .normal)
        
        if let path = Bundle.main.url(forResource: "CountryCode", withExtension: "json") {
            do {
                let  data = try Data(contentsOf: path)
                let  decoder = JSONDecoder()
                let  jsonData = try decoder.decode(CountriesArray.self, from: data)
                print(jsonData)
                
                for x in jsonData {
                    if x.code == locale.regionCode! {
                        print(x.dialCode)
                        userPhoneCode = x.dialCode
                        return
                    }
                }
            } catch {
                print("eerror")
            }
        }
    }
    
    func configureTextFields() {
        
        flagButton = UIButton(type: .custom)
        
        flagButton?.frame =  CGRect(x: 0, y: 0, width: txtfieldMobile.frame.height, height: txtfieldMobile.frame.height)
        flagButton?.setImage(UIImage(named: "flag"), for: .normal)
        
        flagButton?.addTarget(self, action: #selector(flagTapped(_:)), for: .touchUpInside)
       
        txtfieldMobile.label.text = "Mobile Number"
        txtfieldMobile.setOutlineColor(UIColor(hexString: "#f0f4f5"), for: .normal)
        txtfieldMobile.setOutlineColor(UIColor(hexString: "#7b61FF"), for: .editing)
        txtfieldMobile.setTextColor(UIColor.black, for: .normal)
        txtfieldMobile.setFloatingLabelColor(UIColor.lightGray, for: .editing)
        txtfieldMobile.leadingView?.isUserInteractionEnabled = true
        txtfieldMobile.leadingView = flagButton
        txtfieldMobile.leadingViewMode = .always
        
        
        txtfieldMobile.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
    }
    
    func disableButton() {
        self.contiueBtn.layer.opacity = 0.3
        self.contiueBtn.isUserInteractionEnabled = false
    }
    
    func enableButton(){
        self.contiueBtn.layer.opacity = 1
        self.contiueBtn.isUserInteractionEnabled = true
    }
    
    
    @objc func textfieldDidChange(_ textfield:UITextField){
        if textfield.text!.count >= 10 {
            enableButton()
        }else{
            disableButton()
        }
    }
    
    
    @objc func flagTapped(_ sender: UIButton){
        
        countryPicker.showCountriesList(from: self)
        print("flag Tapped")
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("Keyboard Will show METHOD cALLED")
        if let userInfo = notification.userInfo {
            if let keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//                let fram = self.view.convert(keyboardFrame, from: nil)
                
                UIView.animate(withDuration: 1) {
                    let hasNotch = UIDevice.current.hasNotch
                    if hasNotch {
                        self.constraintBottomContinueBtn.constant = keyboardFrame.size.height - 20
                    }else {
                        self.constraintBottomContinueBtn.constant = keyboardFrame.size.height + 10
                    }
                   
                    self.view.layoutIfNeeded()
                }
                
            }
        }
    }
    
    @objc func keyboardWillHide(_ notifcation: Notification) {
        print("Keyboard Will Hide METHOD Called")
        UIView.animate(withDuration: 1) {
            self.constraintBottomContinueBtn.constant = 20
            self.view.layoutIfNeeded()
        }
      
    }
    
}
extension SignUpPhoneNoViewController: CountryPickerViewDelegate {
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
//        let title = "Selected Country"
//        let message = "Name: \(country.name) \nCode: \(country.code) \nPhone: \(country.phoneCode)"
        let flag = country.flag
        flagButton?.setImage(flag, for: .normal)
//
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "ok", style: .default))
//        self.present(alert, animated: true)
        
        self.userPhoneCode = country.phoneCode
    }

}
