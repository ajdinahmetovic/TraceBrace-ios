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

class Messagess: UIViewController {
    
    var didSetupConstraints = false
    
    var box = UIView.newAutoLayout()
    
    
    //OBJEKAT ZA SCROLL VIEW U MESAGESS
    @IBOutlet weak var containerView: UIScrollView!
    
    
  

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
        
        
        //KRAJ
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
  
    
}

//POKUSAJ NECEGA
/*
extension Messagess {
    override func loadView() {
        
        containerView = UIScrollView()
        containerView?.addSubview(box!)
        box?.backgroundColor = UIColor.green
        containerView?.setNeedsUpdateConstraints()
        
        
    }
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            box?.autoSetDimensions(to: CGSize(width: containerView.frame.width, height: 300))
            
            
            box!.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
            box!.autoPinEdge(toSuperviewEdge: .trailing, withInset: 15)
            box!.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
            
            
            
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}
*/
