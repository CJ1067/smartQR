//
//  SettingsViewController.swift
//  SmartQR
//
//  Created by Brandon Wu on 2/8/20.
//  Copyright © 2020 Abhi Jani. All rights reserved.
//

import UIKit

class SocialQRViewController: UIViewController {

    @IBOutlet weak var generateQR2: UIButton!
    @IBOutlet weak var displayCodeView2: UIImageView!
    
    var snapchat = String()
    var linkedin = String()
    var twitter = String()
    var facebook = String()
    var instagram = String()
    
    
    @IBAction func settings(_ sender: Any) {
        
    }
    
    @IBAction func generateQR2(_ sender: Any) {
        
        var text = "https://static-app-onload.herokuapp.com/index.html?"
        
        text.append("snap-name=\(snapchat)&")
        text.append("linked-in-name=\(linkedin)&")
        text.append("twitter-name=\(twitter)&")
        text.append("facebook-name=\(facebook)&")
        text.append("insta-name=\(instagram)&")
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
