//
//  ServiceViewController.swift
//  hoodies_test
//
//  Created by sergemi on 27.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CDManagerDelegate {
    let url = "https://www.w3schools.com/xml/cd_catalog.xml"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let list = CDmanager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Service".localized()
        
        list.delegate = self
        initTable()
    }
    
    func initTable() {
        tableView.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "serviceCell")
        
        showActivity()
        list.load(url: url)
    }
    
    func showActivity() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideActivity() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }

// MARK: - UITableViewDelegate
    
// MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.itemsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ServiceTableViewCell
        let item = list.itemAtIndex(indexPath.row)
        cell.setup(item)

        return cell
    }
    
// MARK: - CDManagerDelegate
    func loadingIsComplete() {
        hideActivity()
        tableView.reloadData()
    }
}
