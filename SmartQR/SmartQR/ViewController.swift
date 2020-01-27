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

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTxt: UITextField!
    
    @IBOutlet weak var displayCodeView: UIImageView!
    
    @IBOutlet weak var lastNameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var phoneNumberTxt: UITextField!
    
    @IBOutlet weak var generateQR: UIButton!
    
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
    
    func createContact() -> String {

        let str = "BEGIN:VCARD \n" + "VERSION:2.1 \n" + "FN:\(firstNameTxt.text!) \(lastNameTxt.text!) \n" + "TEL;CELL:\(phoneNumberTxt.text!) \n" + "EMAIL:\(emailTxt.text!) \n" + "END:VCARD"
        
        return str
        
    }

    @IBAction func generateQR(_ sender: Any) {
        UserDefaults.standard.set(firstNameTxt.text, forKey: "firstName")
        UserDefaults.standard.set(lastNameTxt.text, forKey: "lastName")
        UserDefaults.standard.set(phoneNumberTxt.text, forKey: "phoneNum")
        UserDefaults.standard.set(emailTxt.text, forKey: "email")
        
        let text = createContact()
        let data = text.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let img = UIImage(ciImage: (filter?.outputImage)!.transformed(by: transform))
        
        displayCodeView.image = img
        
        
        // Save image functionality
//        let imageData:Data = UIImagePNGRepresentation(img!)! as Data
//        UserDefaults.standard.set(imageData, forKey: "qr")
//
//        let data = UserDefaults.standard.object(forKey: "qr") as? Data
//        displayCodeView.image = UIImage(data: data as Data)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let firstName = UserDefaults.standard.object(forKey: "firstName") as? String {
            firstNameTxt.text = firstName
        }
        
        if let lastName = UserDefaults.standard.object(forKey: "lastName") as? String {
            lastNameTxt.text = lastName
        }
        
        if let phoneNum = UserDefaults.standard.object(forKey: "phoneNum") as? String {
            phoneNumberTxt.text = phoneNum
        }
        
        if let email = UserDefaults.standard.object(forKey: "email") as? String {
            emailTxt.text = email
        }
        
        
    }
    
}

