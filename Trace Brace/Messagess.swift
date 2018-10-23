//
//  Messagess.swift
//  Trace Brace
//
//  Created by Ajdin Ahmetovic on 12/08/2018.
//  Copyright © 2018 Ajdin Ahmetovic. All rights reserved.
//

import Foundation
import UIKit

import SystemConfiguration
import SystemConfiguration.CaptiveNetwork


class Messagess: UIViewController {
    
    var didSetupConstraints = false
    
    
    
    var arr = [UIView]();
    
    
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
    
    
    
    
    func background(work: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            work()
        }
    }
    
    func main(work: @escaping () -> ()) {
        DispatchQueue.main.async {
            work()
        }
    }
    
    
    
    
    //f
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        let cont = UIView (frame: CGRect(x: 0, y: 0, width: 200, height: 200));
        cont.layer.cornerRadius=10;
        
        let number = UITextView (frame: CGRect(x: 0, y: 0, width: 300, height: 100));
        number.text = "BROJ";
        number.sizeToFit();
        
        
        let message = UITextView (frame: CGRect(x: 0, y: 30, width: 300, height: 100));
        message.text = "Poruka";
        
        
        cont.addSubview(number);
        cont.addSubview(message);
        //container.layer.borderWidth=2
        
        
        
        let cont2 = UIView (frame: CGRect(x: 0, y: 0, width: 200, height: 200));
        cont2.layer.cornerRadius=10;
        
        let number2 = UITextView (frame: CGRect(x: 0, y: 0, width: 300, height: 100));
        number2.text = "BROJ";
        number2.sizeToFit();
        
        
        let message2 = UITextView (frame: CGRect(x: 0, y: 30, width: 300, height: 100));
        message2.text = "Poruka";
        
        
        cont2.addSubview(number2);
        cont2.addSubview(message2);
        
        
        arr.append(cont)
        
        
        
        
        let localDb = UserDefaults.standard;
        let messagess = localDb.array(forKey: "messagess");
        let phoneNumbers = localDb.array(forKey: "phoneNumbers");
        
        var i=0;
        
        let screenSize: CGRect = UIScreen.main.bounds
      
        let container = UIStackView (frame: CGRect(x: 0, y: 100, width: screenSize.width, height: screenSize.height - 100));
        
        container.axis = .horizontal;
        
        container.addArrangedSubview(cont);
        container.addArrangedSubview(cont2);
        
        self.view.addSubview(container);
        
        
        
    /*
            let container = UIView (frame: CGRect(x: 10, y: 100 + i * 10, width: 200, height: 200));
        container.layer.cornerRadius=10;
        
        let number = UITextView (frame: CGRect(x: 0, y: 0, width: 300, height: 100));
        number.text = "BROJ";
        number.sizeToFit();
        
        
        let message = UITextView (frame: CGRect(x: 0, y: 30, width: 300, height: 100));
            message.text = mess as! String;
            
            i = i+1;
        
        container.addSubview(number);
        container.addSubview(message);
        //container.layer.borderWidth=2
    
        
        self.view.addSubview(container);
        
        }
 */
        
        background {
            while true {
                print("tracking ")
            }
        }
        
        
      }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  
    
    
}



