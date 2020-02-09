//
//  ViewController.swift
//  SmartQR
//
//  Created by Abhi Jani on 1/25/20.
//  Copyright © 2020 Abhi Jani. All rights reserved.
//

import UIKit
import Contacts
import SwiftUI

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var snapchatTxt: UITextField!
    @IBOutlet weak var linkedinTxt: UITextField!
    @IBOutlet weak var twitterTxt: UITextField!
    @IBOutlet weak var facebookTxt: UITextField!
    @IBOutlet weak var instagramTxt: UITextField!
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let socialQRViewController = segue.destination as! SocialQRViewController
        socialQRViewController.snapchat = snapchatTxt.text!
        socialQRViewController.linkedin = linkedinTxt.text!
        socialQRViewController.twitter = twitterTxt.text!
        socialQRViewController.facebook = facebookTxt.text!
        socialQRViewController.instagram = instagramTxt.text!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let snapchat = UserDefaults.standard.object(forKey: "user1") as? String {
            snapchatTxt.text = snapchat
        }
        
        if let linkedin = UserDefaults.standard.object(forKey: "user2") as? String {
            linkedinTxt.text = linkedin
        }
        
        if let twitter = UserDefaults.standard.object(forKey: "user3") as? String {
            twitterTxt.text = twitter
        }
        
        if let facebook = UserDefaults.standard.object(forKey: "user4") as? String {
            facebookTxt.text = facebook
        }
        if let instagram = UserDefaults.standard.object(forKey: "user5") as? String {
            instagramTxt.text = instagram
        }
        
    }
    
}

