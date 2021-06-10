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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
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
        self.titleLabel.text = isSelected ? model.title : ""
        self.titleLabel.textColor = K.Colors.selected
        self.titleLabel.numberOfLines = 1
        self.titleLabel.adjustsFontSizeToFitWidth = true
        
        // MARK: - ImageView
        self.imgView.image = model.image
        self.imgView.tintColor = isSelected ? K.Colors.selected : K.Colors.unselected
        self.imageWidth.constant = UIDevice.current.hasNotch ? 30 : 25
        self.imageHeight.constant = UIDevice.current.hasNotch ? 30 : 25
        
        // MARK: - Content View
        self.contentView.layer.cornerRadius = self.contentView.frame.height / 2
        self.contentView.clipsToBounds = false
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = isSelected ? K.Colors.selected.cgColor : K.Colors.unselectedBorder
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
            self.contentView.layer.borderColor = isSelected ? K.Colors.selected.cgColor : K.Colors.unselectedBorder
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
