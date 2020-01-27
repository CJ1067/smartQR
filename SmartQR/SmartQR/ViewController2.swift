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

class ViewController2: UIViewController {
    
    @IBOutlet weak var user1Txt: UITextField!
    @IBOutlet weak var user2Txt: UITextField!
    @IBOutlet weak var user3Txt: UITextField!
    @IBOutlet weak var user4Txt: UITextField!
    @IBOutlet weak var user5Txt: UITextField!
    @IBOutlet weak var generateQR2: UIButton!
    @IBOutlet weak var displayCodeView2: UIImageView!
    
    
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

    @IBAction func generateQR2(_ sender: Any) {
        UserDefaults.standard.set(user1Txt.text, forKey: "user1")
        UserDefaults.standard.set(user2Txt.text, forKey: "user2")
        UserDefaults.standard.set(user3Txt.text, forKey: "user3")
        UserDefaults.standard.set(user4Txt.text, forKey: "user4")
        UserDefaults.standard.set(user5Txt.text, forKey: "user5")
        
        var text = "https://static-app-onload.herokuapp.com/index.html?"
        
        if user1Txt.text != nil {
            text.append("snap-name=\(user1Txt.text!)&")
        }
        
        if user2Txt.text != nil {
            text.append("linked-in-name=\(user2Txt.text!)&")
        }

        if user3Txt.text != nil {
            text.append("twitter-name=\(user3Txt.text!)&")
        }

        if user4Txt.text != nil {
            text.append("facebook-name=\(user4Txt.text!)&")
        }

        if user5Txt.text != nil {
            text.append("insta-name=\(user5Txt.text!)&")
        }
        
        let data = text.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let img = UIImage(ciImage: (filter?.outputImage)!.transformed(by: transform))
        
        displayCodeView2.image = img
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let user1 = UserDefaults.standard.object(forKey: "user1") as? String {
            user1Txt.text = user1
        }
        
        if let user2 = UserDefaults.standard.object(forKey: "user2") as? String {
            user2Txt.text = user2
        }
        
        if let user3 = UserDefaults.standard.object(forKey: "user3") as? String {
            user3Txt.text = user3
        }
        
        if let user4 = UserDefaults.standard.object(forKey: "user4") as? String {
            user4Txt.text = user4
        }
        if let user5 = UserDefaults.standard.object(forKey: "user5") as? String {
            user5Txt.text = user5
        }
        
    }
    
}

