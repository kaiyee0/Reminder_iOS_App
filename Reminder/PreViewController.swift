//
//  PreViewController.swift
//  Reminder
//
//  Created by 林楷翊 on 29/03/2017.
//  Copyright © 2017 林楷翊. All rights reserved.
//

import UIKit

class PreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullScreenSize = UIScreen.main.bounds.size
        
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
        
        
        var subLabel: UILabel!
        //add the sub label of the app
        subLabel = UILabel(frame: CGRect(x: 0, y: 0 , width: 500, height: 80))
        subLabel.text = "Never forget ..."
        subLabel.font = UIFont(name: "SnellRoundhand-Bold", size: 30)
        subLabel.textAlignment = .center
        subLabel.numberOfLines = 2
        subLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        subLabel.center = CGPoint(x: fullScreenSize.width * 0.65, y: fullScreenSize.height * 0.27)
        self.view.addSubview(subLabel)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if(!isUserLoggedIn){
            self.performSegue(withIdentifier: "setupView", sender: self)
        }
        else{
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }
}

