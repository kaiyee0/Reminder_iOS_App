//
//  ResetPassViewController.swift
//  Reminder
//
//  Created by 林楷翊 on 31/03/2017.
//  Copyright © 2017 林楷翊. All rights reserved.
//

import UIKit

class ResetPassViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordConf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        
        self.title = "Reset Password"

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SetupViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    func alertMsg(title:String,msg:String){
        let alertController = UIAlertController(title: title , message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func ResetPass(_ sender: Any) {
        let userPassword = oldPasswordTextField!.text
        
        let newPassword = newPasswordTextField!.text
        
        let passwordConf = newPasswordConf!.text
        if((userPassword?.isEmpty)!||(newPassword?.isEmpty)! || (passwordConf?.isEmpty)!) {
            alertMsg(title: "Alert", msg: "Field cannot be empty")
            return
        }
        
        let userPasswordStored = UserDefaults.standard.string(forKey:"userPassword")
        
        if(userPassword != userPasswordStored){
            alertMsg(title: "Alert", msg: "Password Errors")
            return
        }
       
        
        if(newPassword != passwordConf){
            alertMsg(title: "Alert", msg: "New passwords do not match")
            return
        }
        
        if((userPassword == userPasswordStored) && (newPassword == passwordConf)){
            UserDefaults.standard.set(newPassword, forKey: "userPassword")
            UserDefaults.standard.synchronize()
        }
        alertMsg(title: "Success", msg: "Update Success. It will lead you back to the Login Page to login with your new password")
        self.dismiss(animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == oldPasswordTextField){
            newPasswordTextField.becomeFirstResponder()
        }
        else if(textField == newPasswordTextField){
            newPasswordConf.becomeFirstResponder()
        }
        else if(textField == newPasswordConf){
            dismissKeyboard()
        }
        
        return true
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    

}
