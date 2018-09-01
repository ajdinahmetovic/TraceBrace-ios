//
//  Messagess.swift
//  Trace Brace
//
//  Created by Ajdin Ahmetovic on 12/08/2018.
//  Copyright © 2018 Ajdin Ahmetovic. All rights reserved.
//

import Foundation
import UIKit

class Messagess: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        print("aksndkjaskjnda")
        
        let localDb = UserDefaults.standard
        
        let messagess = localDb.array(forKey: "messagess")
        let phoneNumbers = localDb.array(forKey: "phoneNumbers")
        
        
        
        if localDb.bool(forKey: "newMessage") {
            print("newMessages is here")
            localDb.set(false, forKey: "newMessage")
            localDb.synchronize()
            viewDidLoad()
        }
        
        
        
        if localDb.object(forKey: "phoneNumbers") != nil {
            print("Not null")
            
            for number in phoneNumbers! {
                print(number)
            }
            for message in messagess! {
                print(message)
            }
            
        } else {
            print("isNull")
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        /*
        
        
        print("aksndkjaskjnda")
        
        let localDb = UserDefaults.standard
        
        let messagess = localDb.array(forKey: "messagess")
        let phoneNumbers = localDb.array(forKey: "phoneNumbers")
        
        
        
        if localDb.bool(forKey: "newMessage") {
            print("newMessages is here")
            localDb.set(false, forKey: "newMessage")
            localDb.synchronize()
            viewDidLoad()
        }
        
        
        
        if localDb.object(forKey: "phoneNumbers") != nil {
            print("Not null")
        
        for number in phoneNumbers! {
            print(number)
        }
        for message in messagess! {
            print(message)
        }
        
        } else {
            print("isNull")
        }
 */
        
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
