//
//  ScrollObserver.swift
//  CellParallax
//
//  Created by Don Pironet on 12/04/2017.
//  Copyright © 2017 True Natives. All rights reserved.
//

import UIKit

class ScrollObserver: NSObject {
    private let contentOffsetKeyPath = "contentOffset"
    
    let scrollView: UIScrollView
    let onScrollBlock: (CGPoint) -> Void
    
    init(scrollView: UIScrollView, onScrollBlock: @escaping (CGPoint) -> Void) {
        self.scrollView = scrollView
        self.onScrollBlock = onScrollBlock
        super.init()
        self.scrollView.addObserver(self, forKeyPath: contentOffsetKeyPath, options: [.new], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset", let actualChange = change, let contentOffset = actualChange[.newKey] as? CGPoint {
            onScrollBlock(contentOffset)
        }
    }
    
    func detach() {
        self.scrollView.removeObserver(self, forKeyPath: contentOffsetKeyPath)
    }
    
    deinit {
        self.detach()
    }
}
