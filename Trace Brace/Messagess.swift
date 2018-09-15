//
//  Messagess.swift
//  Trace Brace
//
//  Created by Ajdin Ahmetovic on 12/08/2018.
//  Copyright © 2018 Ajdin Ahmetovic. All rights reserved.
//

import Foundation
import UIKit
import PureLayout
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork


class Messagess: UIViewController {
    
    var didSetupConstraints = false
    
    var box = UIView.newAutoLayout()
    
    
    @IBOutlet weak var container: UIStackView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        
    
        print("aksndkjaskjnda")
        //POCETAK
        
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
            
            //OVE 2 PETLJE TO SVE ISPISUJU
            for number in phoneNumbers! {
                print(number)
            }
            for message in messagess! {
                print(message)
            }
            
        } else {
            print("isNull")
        }
        
        
        let arr = getUsedSSID();
        
        for name in arr {
            print(name);
        }
        
        //KRAJ
    }
    
    
    
    
   
    //create variable
    var SSIDNameArray = NSMutableArray()
    var nameArray : NSArray = [];
    // Here function to return all SSIDName
    func getUsedSSID()->NSArray{
        let interfaces = CNCopySupportedInterfaces()
        if interfaces != nil {
            let interfacesArray = CFBridgingRetain(interfaces) as! NSArray
            if interfacesArray.count > 0 {
                for interfaceName in interfacesArray {
                    let unsafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName as! CFString)! as NSDictionary
                    let SSIDName = unsafeInterfaceData["SSID"] as! String
                    self.SSIDNameArray .add(SSIDName)
                }
                nameArray = self.SSIDNameArray .copy() as! NSArray
                return nameArray;
            }else{
                return nameArray;
            }
        }else{
            return nameArray;
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
  
    
}

//POKUSAJ NECEGA

extension Messagess {
    override func loadView() {
        
        
        container?.addSubview(box!)
        box?.backgroundColor = UIColor.green
        container?.setNeedsUpdateConstraints()
        
        
    }
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            box?.autoSetDimensions(to: CGSize(width: container.frame.width, height: 300))
            
            
            box!.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
            box!.autoPinEdge(toSuperviewEdge: .trailing, withInset: 15)
            box!.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
            
            
            
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}

