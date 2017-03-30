//
//  MoreViewController.swift
//  Reminder
//
//  Created by 林楷翊 on 31/03/2017.
//  Copyright © 2017 林楷翊. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    let fullScreenSize = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "More"

        var headLabel: UILabel!
        
        headLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        
        headLabel.text = "About Reminder"
        headLabel.font = UIFont.boldSystemFont(ofSize: 30)
        headLabel.textColor = UIColor.darkGray
        headLabel.textAlignment = .center
        headLabel.numberOfLines = 1
        headLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        headLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15)
        self.view.addSubview(headLabel)
        
        headLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        
        headLabel.text = "Version: 1.0.0 \n Designer: 林楷翊 \n Department:  \n\t Information Management"
        headLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headLabel.textColor = UIColor.darkGray
        headLabel.textAlignment = .left
        headLabel.numberOfLines = 4
        headLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        headLabel.center = CGPoint(x: fullScreenSize.width * 0.47, y: fullScreenSize.height * 0.3)
        self.view.addSubview(headLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
