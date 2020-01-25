//
//  ViewController.swift
//  SmartQR
//
//  Created by Abhi Jani on 1/25/20.
//  Copyright © 2020 Abhi Jani. All rights reserved.
//

import UIKit
import AddressBook
import Contacts

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTxt: UITextField!
    
    @IBOutlet weak var displayCodeView: UIImageView!
    
    @IBOutlet weak var lastNameTxt: UITextField!
    
    @IBOutlet weak var phoneNumberTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createContact() -> CNMutableContact {
        let contact = CNMutableContact()
        contact.givenName = firstNameTxt.text!
        contact.familyName = lastNameTxt.text!
        
        return contact
        
    }

    @IBAction func generateQR(_ sender: Any) {
        if let text = firstNameTxt.text {
            let data = text.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter?.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            let img = UIImage(ciImage: (filter?.outputImage)!.transformed(by: transform))
            
            displayCodeView.image = img
            
    }
    
        
        
    }
    
    
    
}

