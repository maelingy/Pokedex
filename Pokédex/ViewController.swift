//
//  ViewController.swift
//  Pokédex
//
//  Created by Mae Ling Y on 10/05/2016.
//  Copyright © 2016 Umbrella Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
        UIPageViewControllerDelegate,
        UIPageViewControllerDataSource {
    
    // An array with the names of the ViewControllers that will displayed in the 
    // page view controller. These are the Storyboard id names. ! Be sure to 
    // check the box next to restoration id: Use Storyboard ID.
    var pageArray = ["PageOne", "PageTwo"]
    // Index of the view controller to display.
    var index = 0
    // The Page View controller
    var pageViewController: UIPageViewController!
    
    // MARK: - Utility Methods
    
    // This method returns a view controller with the ID at index in array.
    func getViewControllerAtIndex(_ index: Int) -> UIViewController? {
        // Create a view controller from Storyboard
        let vc = self.storyboard?.instantiateViewController(withIdentifier: pageArray[index])
        
        // Return the view controller
        return vc
    }
    
    
    
    // MARK: - Page View Controller 
    
    // PageViewController delegate methods 
    
    // Returns the View Controller before the current view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Get the index of the view controller before the current view controller
        // Start by setting currentIndex to nil
        var currentIndex: Int? = nil
        // Get the Restoration ID of the current view controller
        if let id = viewController.restorationIdentifier {
            // Find that name in the array
            currentIndex = pageArray.index(of: id)!
        }
        // If currentIndex has a value get the view controller at that index -1.
        if currentIndex! > 0 {
            // Subtract 1, we want the view controller before the current Index
            return getViewControllerAtIndex(currentIndex! - 1)
        }
        // Otherwise return nil
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Get the view controller after the current view controller
        // Set index to nil
        var currentIndex: Int? = nil
        // Now find the id of the current view controller in the array
        if let id = viewController.restorationIdentifier {
            // Get the index of the current view controller id in array
            currentIndex = pageArray.index(of: id)!
        }
        
        // Trya and get the view controller after this one.
        if currentIndex! < pageArray.count - 1 {
            // Add 1 to current index and get that view controller.
            return getViewControllerAtIndex(currentIndex! + 1)
        }
        
        // Otherwise return nil
        return nil
    }
    
    
    // Some other PageViewController delegate methods
     /*
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("Page View Did Finish:\(finished)")
        print(previousViewControllers)
        
    }
   
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageArray.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    */
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Make a Page View Controller 
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        // Set this class as the delegate
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        
        // Add the PageView Controller as a child view controller
        self.addChildViewController(self.pageViewController)
        
        // Need to add it's view also
        self.view.addSubview(self.pageViewController.view)
        
        // Make an array of view controllers with the first view controller
        let viewControllers = [getViewControllerAtIndex(0)!]
        // Set the array of view controllers to start the page view controller
        self.pageViewController.setViewControllers(viewControllers,
            direction: UIPageViewControllerNavigationDirection.forward,
            animated: false,
            completion: nil)
        self.pageViewController.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

