//
//  ViewController.swift
//  CellParallax
//
//  Created by Don Pironet on 12/04/2017.
//  Copyright © 2017 True Natives. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    
    fileprivate let images: [UIImage] = [UIImage(named: "johnwick1")!, UIImage(named: "johnwick2")!, UIImage(named: "hangover1")!, UIImage(named: "hangover2")!, UIImage(named: "hangover3")!, UIImage(named: "houseofcards")!, UIImage(named: "narcos")!]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(forAutoLayout: ())
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ParallaxCell.self, forCellReuseIdentifier: "default")
        
        tableView.tableFooterView = UIView()
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableView)
        self.tableView.autoPinEdgesToSuperviewEdges()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ParallaxCell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! ParallaxCell
        
        let image = self.images[indexPath.row]
        
        cell.updateImage(image: image)
        
        return cell
    }
    
}
