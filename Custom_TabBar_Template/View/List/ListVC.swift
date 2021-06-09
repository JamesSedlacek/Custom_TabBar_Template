//
//  ListVC.swift
//
//  Created by James Sedlacek on 5/26/21.
//

import UIKit

class ListVC: UIViewController {
    
    // MARK: - Variables
    
    var tabDelegate: TabDelegate?
    
    // MARK: - IBOutlets
    
    // MARK: - IBActions
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
}

// MARK: - Tab Delegate

extension ListVC: TabDelegate {
    func toggleScreens(to tab: K.tab) {
        switch tab {
        case .list:
            return
        case .map:
            let storyboard = UIStoryboard(name: K.tab.map.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: K.tab.map.rawValue)
            self.tabDelegate?.tabSegue(to: vc, from: self)
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
