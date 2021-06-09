//
//  BottomStackItem.swift
//
//  Created by James Sedlacek on 5/26/21.
//

import UIKit

class TabBarItem {
    
    var title: String
    var image: UIImage
    var isSelected: Bool
    
    init(title: String,
         image: UIImage,
         isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
    
}
