//
//  SettingsViewController.swift
//  SmartQR
//
//  Created by Brandon Wu on 2/8/20.
//  Copyright © 2020 Abhi Jani. All rights reserved.
//

import UIKit

class SocialQRViewController: UIViewController, sendDataDelegate {

    @IBOutlet weak var generateQR2: UIButton!
    @IBOutlet weak var displayCodeView2: UIImageView!
    
    var snapchat = String()
    var linkedin = String()
    var twitter = String()
    var facebook = String()
    var instagram = String()
    
    var snapchatSwitch = true
    var linkedinSwitch = true
    var twitterSwitch = true
    var facebookSwitch = true
    var instagramSwitch = true
    
    func sendData(snapchatField: String, linkedinField: String, twitterField: String, facebookField: String, instagramField: String, snapchatSwitchField: Bool, linkedinSwitchField: Bool, twitterSwitchField: Bool, facebookSwitchField: Bool, instagramSwitchField: Bool) {
        snapchat = snapchatField
        linkedin = linkedinField
        twitter = twitterField
        facebook = facebookField
        instagram = instagramField
        
        snapchatSwitch = snapchatSwitchField
        linkedinSwitch = linkedinSwitchField
        twitterSwitch = twitterSwitchField
        facebookSwitch = facebookSwitchField
        instagramSwitch = instagramSwitchField
    }
    @IBAction func generateQR2(_ sender: Any) {
        
        var text = "https://static-app-onload.herokuapp.com/index.html?"
        
        if (snapchatSwitch) {
            text.append("snap-name=\(snapchat)&")
        }
        if (linkedinSwitch) {
            text.append("linked-in-name=\(linkedin)&")
        }
        if (twitterSwitch) {
            text.append("twitter-name=\(twitter)&")
        }
        if (facebookSwitch) {
            text.append("facebook-name=\(facebook)&")
        }
        if (instagramSwitch) {
            text.append("insta-name=\(instagram)&")
        }
        
        let data = text.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let img = UIImage(ciImage: (filter?.outputImage)!.transformed(by: transform))
        
        displayCodeView2.image = img
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataSegue" {
            let vc : SettingsViewController = segue.destination as! SettingsViewController
            vc.delegate = self
        }
    }

}
