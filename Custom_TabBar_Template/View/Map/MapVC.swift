//
//  MapVC.swift
//
//  Created by James Sedlacek on 5/26/21.
//

import UIKit

class MapVC: UIViewController {
    
    // MARK: - Variables
    
    var tabDelegate: TabDelegate?
    
    // MARK: - IBOutlets
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Tab Delegate

extension MapVC: TabDelegate {
    func toggleScreens(to tab: K.tab) {
        switch tab {
        case .list:
            let storyboard = UIStoryboard(name: K.tab.list.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: K.tab.list.rawValue)
            self.tabDelegate?.tabSegue(to: vc, from: self)
        case .map:
            return
        case .saved:
            let storyboard = UIStoryboard(name: K.tab.saved.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: K.tab.saved.rawValue)
            self.tabDelegate?.tabSegue(to: vc, from: self)
        case .settings:
            let storyboard = UIStoryboard(name: K.tab.settings.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: K.tab.settings.rawValue)
            self.tabDelegate?.tabSegue(to: vc, from: self)
        }
    }
    
    func tabSegue(to newVC: UIViewController, from oldVC: UIViewController) {}
    
}
