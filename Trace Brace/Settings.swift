//
//  Settings.swift
//  Trace Brace
//
//  Created by Ajdin Ahmetovic on 15/09/2018.
//  Copyright © 2018 Ajdin Ahmetovic. All rights reserved.
//

import Foundation
import UIKit


class Settings: UITableViewController {
    
    @IBOutlet weak var contact: UIView!
    
    @IBOutlet weak var gpsSetting: UISwitch!
    
    @IBOutlet weak var liveTracking: UISwitch!
    
    @IBOutlet weak var feedback: UIView!
    
    @IBOutlet weak var buy: UIView!
    
    override func viewDidLoad() {
        
        let localDb = UserDefaults.standard
        
        if localDb.bool(forKey: "gpsSet") {
            print("GPSON")
            gpsSetting.isOn = true;
            
        } else {
            gpsSetting.isOn = false;
        }
        
        if localDb.bool(forKey: "liveTrack") {
            print("LIVETRACKON")
            liveTracking.isOn = true;
            
        } else {
            liveTracking.isOn = false;
        }
        
        
        
        
    }
    
    
    
    @IBAction func gpsSetting(_ sender: Any) {
        
        if(gpsSetting.isOn){
            print("ONNNNNN")
            let localDb = UserDefaults.standard;
            
            localDb.set(true, forKey: "gpsSet");
            localDb.synchronize();
            
            
            
        } else {
            let localDb = UserDefaults.standard;
            localDb.set(false, forKey: "gpsSet");
            localDb.synchronize();
            print("OFF")
            
            
        }
        
    }
    
    
    @IBAction func liveTracking(_ sender: Any) {
        
        if(liveTracking.isOn){
            print("Live ON")
            let localDb = UserDefaults.standard;
            
            localDb.set(true, forKey: "liveTrack");
            localDb.synchronize();
            
        } else {
            
            let localDb = UserDefaults.standard;
            localDb.set(false, forKey: "liveTrack");
            localDb.synchronize();
            
        }
        
    }
    
    
    @IBAction func about(_ sender: Any) {
        guard let url = URL(string: "https://tracebrace.site") else { return }
        UIApplication.shared.openURL(url)
    }
    
    
    @IBAction func buy(_ sender: Any) {
        guard let url = URL(string: "https://tracebrace.site") else { return }
        UIApplication.shared.openURL(url)
    }
    
    @IBAction func feedback(_ sender: Any) {
        guard let url = URL(string: "https://tracebrace.site") else { return }
        UIApplication.shared.openURL(url)
        
    }
    
    

    
}
