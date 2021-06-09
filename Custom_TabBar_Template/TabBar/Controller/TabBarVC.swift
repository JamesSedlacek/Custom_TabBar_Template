//
//  TabBarVC.swift
//
//  Created by James Sedlacek on 6/4/21.
//

import UIKit

class TabBarVC: UIViewController {
    
    // MARK: - Variables
    
    var rootTabVC: RootTabVC?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var PresentingView: UIView!

    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomConstraint()
    }
    
    // MARK: - Prepare
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //initialize the Presenting Container View
        if segue.identifier == K.Identifiers.listSegue {
            if let nav = segue.destination as? UINavigationController,
               let vc = nav.topViewController as? ListVC {
                vc.tabDelegate = self
                rootTabVC?.tabDelegate = vc
            }
        }
        
        //initialize the Root Tab ViewController
        else if segue.identifier == K.Identifiers.rootSegue {
            if let vc = segue.destination as? RootTabVC {
                rootTabVC = vc
            }
        }
    }
    
    // MARK: - Handle Notch
    
    //This sets the bottom constraint of the Tab Bar
    //Based on if the phone has a Notch or not
    func setupBottomConstraint() {
        if UIDevice.current.hasNotch {
            bottomConstraint.constant = -8
        } else {
            bottomConstraint.constant = 16
        }
    }

}

// MARK: - Tab Delegate

extension TabBarVC: TabDelegate {
    func toggleScreens(to tab: K.tab) {}
    
    func tabSegue(to newVC: UIViewController, from oldVC: UIViewController) {
        removeOldVC(viewController: oldVC)
        addNewVC(viewController: newVC)
    }
    
    func removeOldVC(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
        if PresentingView.subviews.count > 0 {
            PresentingView.subviews[0].removeFromSuperview() //removes old Nav Bar
        }
    }
    
    func addNewVC(viewController: UIViewController) {
        if let nav = viewController as? UINavigationController,
           let vc = nav.topViewController {
            addChild(nav)
            setDelegates(viewController: vc)
            vc.view.frame = PresentingView.bounds
            nav.view.frame = PresentingView.bounds
            nav.viewControllers = [vc]
            PresentingView.addSubview(nav.view)
            nav.didMove(toParent: self)
        }
    }
    
    func setDelegates(viewController: UIViewController) {
        if let vc = viewController as? ListVC {
            vc.tabDelegate = self
            rootTabVC?.tabDelegate = vc
        }
        
        else if let vc = viewController as? MapVC {
            vc.tabDelegate = self
            rootTabVC?.tabDelegate = vc
        }
        
        else if let vc = viewController as? SavedVC {
            vc.tabDelegate = self
            rootTabVC?.tabDelegate = vc
        }

        else if let vc = viewController as? SettingsTVC {
            vc.tabDelegate = self
            rootTabVC?.tabDelegate = vc
        }
    }

}


