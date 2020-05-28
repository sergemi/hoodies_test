//
//  ListViewController.swift
//  hoodies_test
//
//  Created by sergemi on 27.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var items = Items()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.topItem?.title = "List".localized()
        navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem.init(title: "Add".localized(), style: .done, target: self, action: #selector(self.addItem(sender:)))
        
        initTable()

    }
    
    func initTable() {
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "listCell")
        
        items.loadList()
        
//        items.addItem("aaa")
//        items.addItem("bbb")
    }
    
    @objc func addItem(sender: AnyObject) {
        print("add")
    }

// MARK: - UITableViewDelegate
    
// MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        
        let cellData = items.list[indexPath.row]
        cell.setupFromItem(cellData)
        return cell
    }

}
