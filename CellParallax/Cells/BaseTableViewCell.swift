//
//  BaseTableViewCell.swift
//  CellParallax
//
//  Created by Don Pironet on 12/04/2017.
//  Copyright © 2017 True Natives. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    var didSetupConstrainst: Bool = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.baseSetup()
        self.contentView.setNeedsUpdateConstraints()
    }
    
    func baseSetup() {
        fatalError("should be overwritten")
    }
    
    override func updateConstraints() {
        if !didSetupConstrainst {
            self.setupConstraints()
            self.didSetupConstrainst = true
        }
        
        self.setupExtraConstraints()
        
        super.updateConstraints()
    }
    
    func setupConstraints() {
        fatalError("should be overwritten")
    }
    
    func setupExtraConstraints() {
        
    }    
}
