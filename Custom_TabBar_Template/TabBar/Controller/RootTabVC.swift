//
//  RootStackTabVC.swift
//
//  Created by James Sedlacek on 5/26/21.
//

import UIKit

class RootTabVC: UIViewController {
    
    // MARK: - Variables
    
    var currentIndex = 0
        
    lazy var tabs: [TabBarItemView] = {
        var items = [TabBarItemView]()
        for _ in 0..<4 {
            items.append(TabBarItemView.newInstance)
        }
        return items
    }()
    
    lazy var tabModels: [TabBarItem] = {
        return [
            TabBarItem(title: K.tab.list.rawValue,
                            image: K.Images.list!),
            TabBarItem(title: K.tab.map.rawValue,
                            image: K.Images.map!),
            TabBarItem(title: K.tab.saved.rawValue,
                            image: K.Images.saved!),
            TabBarItem(title: K.tab.settings.rawValue,
                            image: K.Images.settings!)
        ]
    }()
        
    var tabDelegate: TabDelegate?
    
    // MARK: - IBOutlets

    @IBOutlet weak var tabBarStackView: UIStackView!
    @IBOutlet weak var backgroundView: UIView!
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        setupStackViewBackground()
    }
    
    func setupStackViewBackground() {
        backgroundView.clipsToBounds = false
        backgroundView.layer.cornerRadius = backgroundView.layer.frame.height / 2
    }

    func setupTabs() {
        for (index, model) in self.tabModels.enumerated() {
            let tabView = self.tabs[index]
            model.isSelected = index == 0
            tabView.item = model
            tabView.delegate = self
            self.tabBarStackView.insertArrangedSubview(tabView, at: index)
        }
    }
    
}

// MARK: - Handle Tap

extension RootTabVC: TabBarItemViewDelegate {
    
    func handleTap(_ view: TabBarItemView) {
        self.tabs[self.currentIndex].isSelected = false
        view.isSelected = true
        self.currentIndex = self.tabs.firstIndex(where: { $0 === view }) ?? 0
        
        switch currentIndex {
        case 0:
            tabDelegate?.toggleScreens(to: K.tab.list)
        case 1:
            tabDelegate?.toggleScreens(to: K.tab.map)
        case 2:
            tabDelegate?.toggleScreens(to: K.tab.saved)
        case 3:
            tabDelegate?.toggleScreens(to: K.tab.settings)
        default:
            tabDelegate?.toggleScreens(to: K.tab.list)
        }
    }
    
}
