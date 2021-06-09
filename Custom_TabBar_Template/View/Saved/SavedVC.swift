//
//  SavedVC.swift
//
//  Created by James Sedlacek on 6/5/21.
//

import UIKit

class SavedVC: UIViewController {
    
    // MARK: - Variables
    
    var tabDelegate: TabDelegate?
    
    // MARK: - IBOutlets
    
    // MARK: - IBActions
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Tab Delegate

extension SavedVC: TabDelegate {
    func toggleScreens(to tab: K.tab) {
        switch tab {
        case .list:
            let storyboard = UIStoryboard(name: K.tab.list.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: K.tab.list.rawValue)
            self.tabDelegate?.tabSegue(to: vc, from: self)
        case .map:
            let storyboard = UIStoryboard(name: K.tab.map.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: K.tab.map.rawValue)
            self.tabDelegate?.tabSegue(to: vc, from: self)
        case .saved:
            return
        case .settings:
            let storyboard = UIStoryboard(name: K.tab.settings.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: K.tab.settings.rawValue)
            self.tabDelegate?.tabSegue(to: vc, from: self)
        }
    }
    
    func tabSegue(to newVC: UIViewController, from oldVC: UIViewController) {}
    
}
