//
//  OnboardingPager.swift
//  Trace Brace
//
//  Created by Ajdin Ahmetovic on 11/08/2018.
//  Copyright © 2018 Ajdin Ahmetovic. All rights reserved.
//



import UIKit

class OnboardingPager : UIPageViewController {
    
    
    override func viewDidLoad() {
        
        
  

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isAppAlreadyLaunchedOnce() {
            print("LOLOLOLOLO")
            /*
             let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let newViewController = storyBoa rd.instantiateViewController(withIdentifier: "Messagess")
             self.navigationController?.pushViewController(newViewController, animated: true)
             
             
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let controller = storyboard.instantiateViewController(withIdentifier: "Messagess")
             self.present(controller, animated: true, completion: nil)
             */
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "Messagess")
            present(viewController, animated: true, completion: nil)
            
            
            
            
        } else {
            
            
            dataSource = self
            
            
            delegate = self
            view.backgroundColor = UIColor(red:1.00, green:0.53, blue:0.02, alpha:1.0)
            setViewControllers([getStepZero()], direction: .forward, animated: false, completion: nil)
            
        }
    }
    
    
    
    func getStepZero() -> StepZero {
        return storyboard!.instantiateViewController(withIdentifier: "StepZero") as! StepZero
    }
    
    func getStepOne() -> StepOne {
        return storyboard!.instantiateViewController(withIdentifier: "StepOne") as! StepOne
    }
    
    func getStepTwo() -> StepTwo {
        return storyboard!.instantiateViewController(withIdentifier: "StepTwo") as! StepTwo
    }
    
    func getStepThree() -> StepThree {
        return storyboard!.instantiateViewController(withIdentifier: "StepThree") as! StepThree
        
    }
}

extension OnboardingPager : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if viewController is StepThree {
            return getStepTwo()
        } else if viewController is StepTwo {
            return getStepOne()
        } else if viewController is StepOne {
            return getStepZero()
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is StepZero {
            return getStepOne()
        } else if viewController is StepOne {
            return getStepTwo()
        } else if viewController is StepTwo {
            return getStepThree()
        } else {
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
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

extension OnboardingPager : UIPageViewControllerDelegate {
    
}
