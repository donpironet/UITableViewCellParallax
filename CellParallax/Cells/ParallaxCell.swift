//
//  ParallaxCell.swift
//  CellParallax
//
//  Created by Don Pironet on 12/04/2017.
//  Copyright © 2017 True Natives. All rights reserved.
//

import UIKit

class ParallaxCell: BaseTableViewCell {
    
    private var observer: ScrollObserver?
    
    private let cellImageView = UIImageView(frame: .zero)
    private var topConstraint: NSLayoutConstraint?
    
    override func baseSetup() {
        self.clipsToBounds = true
        
        self.contentView.addSubview(self.cellImageView)
    }
    
    override func setupConstraints() {
        self.topConstraint = cellImageView.autoPinEdge(toSuperviewEdge: .top)
        self.cellImageView.autoPinEdge(toSuperviewEdge: .left)
        self.cellImageView.autoPinEdge(toSuperviewEdge: .right)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cellImageView.superview?.bringSubview(toFront: cellImageView)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let tableView = self.findSuperViewWithClass(superViewClass: UITableView.self) {
            self.observer = ScrollObserver(scrollView: tableView, onScrollBlock: { (_) in
                self.refresh(tableView: tableView)
            })
            self.refresh(tableView: tableView)
        }
    }
    
    func refresh(tableView: UITableView) {
        let windowBounds = self.window!.bounds
        let rect = tableView.convert(self.frame, to: nil)
        
        let imageHeight = self.cellImageView.image?.size.height ?? 0
        let y: CGFloat = (rect.minY / windowBounds.height) * imageHeight
        
        self.topConstraint?.constant = -1 * y
        
        self.layoutIfNeeded()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview == nil {
            self.observer = nil
        }
    }
    
    func updateImage(image: UIImage) {
        self.cellImageView.image = image
        
        if let tableView = self.findSuperViewWithClass(superViewClass: UITableView.self) {
            self.refresh(tableView: tableView)
        }
    }
}
