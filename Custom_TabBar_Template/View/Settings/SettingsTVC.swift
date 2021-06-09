//
//  SettingsTVC.swift
//
//  Created by James Sedlacek on 6/5/21.
//

import UIKit

class SettingsTVC: UITableViewController {
    
    // MARK: - Variables
   
    var tabDelegate: TabDelegate?
    
    // MARK: - IBOutlets
    
    // MARK: - IBActions
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
    }
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}

// MARK: - Tab Delegate

extension SettingsTVC: TabDelegate {
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
            let storyboard = UIStoryboard(name: K.tab.saved.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: K.tab.saved.rawValue)
            self.tabDelegate?.tabSegue(to: vc, from: self)
        case .settings:
            return
        }
    }
    
    func tabSegue(to newVC: UIViewController, from oldVC: UIViewController) {}
    
}
