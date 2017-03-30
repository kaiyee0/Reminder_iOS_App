//
//  SetupViewController.swift
//  Reminder
//
//  Created by 林楷翊 on 29/03/2017.
//  Copyright © 2017 林楷翊. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, UITextViewDelegate {
    
    
    
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        super.viewDidLoad()
        let fullScreenSize = UIScreen.main.bounds.size
        
        
        var headLabel: UILabel!
        
        //add the hading label of the app
        headLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        
        headLabel.text = "First Setup"
        headLabel.font = UIFont.boldSystemFont(ofSize: 60)
        headLabel.textColor = UIColor.darkGray
        headLabel.textAlignment = .center
        headLabel.numberOfLines = 1
        headLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        headLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15)
        self.view.addSubview(headLabel)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SetupViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
//        
//        if(true){
//            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertMsg(msg: String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        myAlert.addAction(ok)
        
        self.present(myAlert, animated: true,completion: nil)
        
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        //let userName = userNameTextField!.text
        let userPassword = userPasswordTextField!.text
        let confirmPassword = confirmPasswordTextField!.text
        let userEmail = userEmailTextField!.text
        
        if((userPassword?.isEmpty)! || (confirmPassword?.isEmpty)! || (userEmail?.isEmpty)! ){
            
            alertMsg(msg: "All Fields are required")
            return
        }
        
        if(userPassword != confirmPassword){
            alertMsg(msg: "Passwords do not match")
            return
            
        }
        
        //UserDefaults.standard.set(userName, forKey:  "userName")
        
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        
        UserDefaults.standard.set(1, forKey: "isUserLoggedIn")
        
        UserDefaults.standard.synchronize()
        
        
        let myAlert = UIAlertController(title: "Alert", message: "Welcome to Reminder" ,preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "ok", style: .default) { action in self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(ok)
        
        self.performSegue(withIdentifier: "goLoginView", sender: self)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //delegate method
//        if(textField == userNameTextField){
//            userPasswordTextField.becomeFirstResponder()
//        }
        if(textField == userEmailTextField){
            userPasswordTextField.becomeFirstResponder()
            
        }
        else if(textField == userPasswordTextField){
            confirmPasswordTextField.becomeFirstResponder()
        }
        else if(textField == confirmPasswordTextField){
            dismissKeyboard()
        }
        
        return true
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height * 0.5
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height * 0.5
            }
        }
    }
    
}
