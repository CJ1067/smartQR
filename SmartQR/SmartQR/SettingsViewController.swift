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

protocol sendDataDelegate {
    func sendData(snapchatField: String, linkedinField: String, twitterField: String, facebookField: String, instagramField: String, snapchatSwitchField: Bool, linkedinSwitchField: Bool, twitterSwitchField: Bool, facebookSwitchField: Bool, instagramSwitchField: Bool)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var snapchatTxt: UITextField!
    @IBOutlet weak var linkedinTxt: UITextField!
    @IBOutlet weak var twitterTxt: UITextField!
    @IBOutlet weak var facebookTxt: UITextField!
    @IBOutlet weak var instagramTxt: UITextField!
    
    @IBOutlet weak var snapchatSwitch: UISwitch!
    @IBOutlet weak var linkedinSwitch: UISwitch!
    @IBOutlet weak var twitterSwitch: UISwitch!
    @IBOutlet weak var facebookSwitch: UISwitch!
    @IBOutlet weak var instagramSwitch: UISwitch!
    
    var delegate : sendDataDelegate?
    
    override func viewWillDisappear(_ animated: Bool) {
        
        UserDefaults.standard.set(snapchatTxt.text, forKey: "user1")
        UserDefaults.standard.set(linkedinTxt.text, forKey: "user2")
        UserDefaults.standard.set(twitterTxt.text, forKey: "user3")
        UserDefaults.standard.set(facebookTxt.text, forKey: "user4")
        UserDefaults.standard.set(instagramTxt.text, forKey: "user5")
        
        UserDefaults.standard.set(snapchatSwitch.isOn, forKey: "snapchatSwitch")
        UserDefaults.standard.set(linkedinSwitch.isOn, forKey: "linkedinSwitch")
        UserDefaults.standard.set(twitterSwitch.isOn, forKey: "twitterSwitch")
        UserDefaults.standard.set(facebookSwitch.isOn, forKey: "facebookSwitch")
        UserDefaults.standard.set(instagramSwitch.isOn, forKey: "instagramSwitch")
        
        
        if delegate != nil {
            delegate?.sendData(snapchatField: snapchatTxt.text!, linkedinField: linkedinTxt.text!, twitterField: twitterTxt.text!, facebookField: facebookTxt.text!, instagramField: instagramTxt.text!, snapchatSwitchField: snapchatSwitch.isOn, linkedinSwitchField: linkedinSwitch.isOn, twitterSwitchField: twitterSwitch.isOn, facebookSwitchField: facebookSwitch.isOn, instagramSwitchField: instagramSwitch.isOn)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
        
        if let snapchatSwitchValue = UserDefaults.standard.object(forKey: "snapchatSwitch") as? Bool {
            snapchatSwitch.isOn = snapchatSwitchValue
        }
        
        if let linkedinSwitchValue = UserDefaults.standard.object(forKey: "linkedinSwitch") as? Bool {
            linkedinSwitch.isOn = linkedinSwitchValue
        }
        
        if let twitterSwitchValue = UserDefaults.standard.object(forKey: "twitterSwitch") as? Bool {
            twitterSwitch.isOn = twitterSwitchValue
        }
        
        if let facebookSwitchValue = UserDefaults.standard.object(forKey: "facebookSwitch") as? Bool {
            facebookSwitch.isOn = facebookSwitchValue
        }
        
        if let instagramSwitchValue = UserDefaults.standard.object(forKey: "instagramSwitch") as? Bool {
            instagramSwitch.isOn = instagramSwitchValue
        }
        
    }
    
}

