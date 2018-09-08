//
//  CreateMessage.swift
//  Trace Brace
//
//  Created by Ajdin Ahmetovic on 30/08/2018.
//  Copyright © 2018 Ajdin Ahmetovic. All rights reserved.
//

import Foundation
import UIKit

class CreateMessage: UIViewController {
    
    
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var numberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.messageText.layer.borderColor = UIColor(red:1.00, green:0.75, blue:0.33, alpha:1.0).cgColor
        self.messageText.layer.borderWidth = 2.3
        self.messageText.layer.cornerRadius = 5
        
        
        self.numberText.layer.borderColor = UIColor(red:1.00, green:0.75, blue:0.33, alpha:1.0).cgColor
        self.numberText.layer.borderWidth = 2.3
        self.numberText.layer.cornerRadius = 5
        
        
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func addMessage(_ sender: Any) {
        
        //OVDJE DODAJE PORUKE
        
         let message = messageText.text
         let phoneNumber = numberText.text
        
        let localDb = UserDefaults.standard
        
        if localDb.object(forKey: "phoneNumbers") == nil {
            
        
        
            
            
            let phoneNumbers = [phoneNumber]
            let messagess = [message]
            
            localDb.set(phoneNumbers, forKey: "phoneNumbers")
            localDb.set(messagess, forKey: "messagess")
            
            localDb.synchronize()
            
            
        } else {
            var phoneNumbers = localDb.array(forKey: "phoneNumbers");
            var messagess = localDb.array(forKey: "messagess")
            
            phoneNumbers?.append(phoneNumber!)
            messagess?.append(message!)
            
            
            localDb.set(phoneNumbers, forKey: "phoneNumbers")
            localDb.set(messagess, forKey: "messagess")
            
            localDb.set(true, forKey: "newMessage")
            
            localDb.synchronize()
            
            let messagessView: Messagess = Messagess();
            messagessView.viewDidAppear(false)
            
            

        }
        
        
        
        
        
        print(message!, phoneNumber!)
        
        dismiss(animated: true, completion: nil)
        
    }
}

