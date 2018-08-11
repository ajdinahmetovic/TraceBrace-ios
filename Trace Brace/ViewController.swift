//
//  ViewController.swift
//  Trace Brace
//
//  Created by Ajdin Ahmetovic on 10/08/2018.
//  Copyright © 2018 Ajdin Ahmetovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var onboarding_box: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a
        
        onboarding_box.isUserInteractionEnabled = true
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.getSwipeAction(_:)))

        self.onboarding_box.addGestureRecognizer(swipeGesture)
        print("kULJ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func getSwipeAction( _ recognizer : UISwipeGestureRecognizer){
        
        if recognizer.direction == .right{
            print("Right Swiped")
        } else if recognizer.direction == .left {
            print("Left Swiped")
        }
    }

}

