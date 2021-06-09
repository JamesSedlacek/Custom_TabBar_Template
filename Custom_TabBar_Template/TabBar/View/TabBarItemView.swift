//
//  StackItemView.swift
//
//  Created by James Sedlacek on 5/26/21.
//

import UIKit

class TabBarItemView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    // MARK: - Variables
    
    static var newInstance: TabBarItemView {
        return Bundle.main.loadNibNamed(
            K.Identifiers.mainNib,
            owner: nil,
            options: nil
        )?.first as! TabBarItemView
    }
    
    weak var delegate: TabBarItemViewDelegate?
    
    // MARK: - Awake From Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addTapGesture()
    }
    
    var isSelected: Bool = false {
        willSet {
            self.updateUI(isSelected: newValue)
        }
    }
    
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    // MARK: - Configure
    
    private func configure(_ item: Any?) {
        guard let model = item as? TabBarItem else { return }
        self.isSelected = model.isSelected
        
        // MARK: - Title Label
        self.titleLabel.text = model.title
        self.titleLabel.textColor = K.Colors.selected
        self.titleLabel.numberOfLines = 1
        self.titleLabel.sizeToFit()
        self.titleLabel.lineBreakMode = .byWordWrapping
        
        // MARK: - ImageView
        self.imgView.image = model.image
        self.imgView.tintColor = isSelected ? K.Colors.selected : K.Colors.unselected

        // MARK: - Self
        self.layer.borderColor = isSelected ? K.Colors.selected.cgColor : K.Colors.unselectedBorder
        self.backgroundColor = K.Colors.tabBackground
        self.frame.size.height = 30
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
    }
    
    private func updateUI(isSelected: Bool) {
        guard let model = item as? TabBarItem else { return }
        model.isSelected = isSelected
        let options: UIView.AnimationOptions = isSelected ? [.curveEaseInOut] : [.curveEaseOut]
        
        // MARK: - Tab Bar Animation
        
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.2,
                       options: options,
                       animations: {
            self.titleLabel.text = isSelected ? model.title : ""
            self.imgView.tintColor = isSelected ? K.Colors.selected : K.Colors.unselected
            self.layer.borderColor = isSelected ? K.Colors.selected.cgColor : K.Colors.unselectedBorder
            (self.superview as? UIStackView)?.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK: - Gesture Handler
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleGesture(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func handleGesture(_ sender: UITapGestureRecognizer) {
        self.delegate?.handleTap(self)
    }
    
}
