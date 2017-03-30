//
//  LoginViewController.swift
//  Reminder
//
//  Created by 林楷翊 on 29/03/2017.
//  Copyright © 2017 林楷翊. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextViewDelegate{
    
    let fullScreenSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        var headLabel: UILabel!
        
        //add the hading label of the app
        headLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        
        headLabel.text = "Reminder"
        headLabel.font = UIFont.boldSystemFont(ofSize: 60)
        headLabel.textColor = UIColor.darkGray
        headLabel.textAlignment = .center
        headLabel.numberOfLines = 1
        headLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        headLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15)
        self.view.addSubview(headLabel)
        
        
        //add the hading label of the app
        headLabel = UILabel(frame: CGRect(x: 0, y: 120, width: 300, height: 80))
        
        headLabel.text = "Login Page"
        headLabel.font = UIFont.boldSystemFont(ofSize: 30)
        headLabel.textColor = UIColor.darkGray
        headLabel.textAlignment = .center
        headLabel.numberOfLines = 1
        headLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        headLabel.center = CGPoint(x: fullScreenSize.width * 0.65, y: fullScreenSize.height * 0.25)
        self.view.addSubview(headLabel)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SetupViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    

    @IBOutlet weak var userPasswordTextField: UITextField!

    func alertMsg(title:String,msg:String){
        let alertController = UIAlertController(title: title , message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let userPassword = userPasswordTextField!.text
        
        if((userPassword?.isEmpty)!){
            alertMsg(title: "Alert", msg: "Field cannot be empty")
            return
        }
        
        let userPasswordStored = UserDefaults.standard.string(forKey:"userPassword")
        
        
        if(userPasswordStored == userPassword){
            alertMsg(title: "Welcome", msg: "Welcome to Reminder")
            self.performSegue(withIdentifier: "homePage", sender: self)
        }
        else{
            alertMsg(title: "Alert", msg: "Password is Wrong!!!")
        }
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == userPasswordTextField){
            dismissKeyboard()
        }
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
