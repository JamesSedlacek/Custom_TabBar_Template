//
//  K.swift
//
//  Created by James Sedlacek on 6/3/21.
//

import UIKit

struct K {
    
    // MARK: - Identifiers
    
    struct Identifiers {
        static let mainNib = "TabBarItemView"
        static let listSegue = "SegueToList"
        static let rootSegue = "SegueToRoot"
    }
    
    // MARK: - Colors
    
    struct Colors {
        static let selected = UIColor.white
        static let unselected = UIColor.lightGray
        static let unselectedBorder = UIColor.clear.cgColor
        static let tabBackground = UIColor.clear
        static let tabBar = UIColor(named: "TabBarColor")
    }
    
    // MARK: - Images
    
    struct Images {
        static let list = UIImage(systemName: "list.bullet")
        static let map = UIImage(systemName: "map")
        static let saved = UIImage(systemName: "star")
        static let settings = UIImage(systemName: "gearshape")
    }
    
    // MARK: - Tab Bar
    
    enum tab: String {
        case list = "List"
        case map = "Map"
        case saved = "Saved"
        case settings = "Settings"
    }
}

// MARK: - Protocols

protocol TabBarItemViewDelegate: class {
    func handleTap(_ view: TabBarItemView)
}

protocol TabDelegate {
    func toggleScreens(to tab: K.tab)
    func tabSegue(to newVC: UIViewController, from oldVC: UIViewController)
}

// MARK: - UIDevice Extension

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.windows[0].safeAreaInsets.bottom
        return bottom > 0
    }
}
