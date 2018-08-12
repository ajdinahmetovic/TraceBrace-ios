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
        // Set the dataSource and delegate in code.
        // I can't figure out how to do this in the Storyboard!
        dataSource = self
        delegate = self
        // this sets the background color of the built-in paging dots
        view.backgroundColor = UIColor(red:1.00, green:0.53, blue:0.02, alpha:1.0)
        
        // This is the starting point.  Start with step zero.
        setViewControllers([getStepZero()], direction: .forward, animated: false, completion: nil)
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

// MARK: - UIPageViewControllerDataSource methods
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
    
    // Enables pagination dots
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    // This only gets called once, when setViewControllers is called
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

// MARK: - UIPageViewControllerDelegate methods
extension OnboardingPager : UIPageViewControllerDelegate {
    
}
