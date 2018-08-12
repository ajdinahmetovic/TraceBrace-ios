//
//  Selector.swift
//  Trace Brace
//
//  Created by Ajdin Ahmetovic on 12/08/2018.
//  Copyright © 2018 Ajdin Ahmetovic. All rights reserved.
//

import Foundation
import UIKit

class Selector: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isAppAlreadyLaunchedOnce() {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Messagess")
            self.present(controller, animated: true, completion: nil)
            
        } else {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "OnboardingPager")
            self.present(controller, animated: true, completion: nil)
        
        }
        
    }
    
    
    func isAppAlreadyLaunchedOnce()->Bool{
        let defaults = UserDefaults.standard
        
        if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
            print("App already launched : \(isAppAlreadyLaunchedOnce)")
            return true
        }else{
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
    
}
