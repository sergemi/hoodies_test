//
//  ListViewController.swift
//  hoodies_test
//
//  Created by sergemi on 27.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var items = Items()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Add".localized(), style: .done, target: self, action: #selector(self.addItem(sender:)))
        
        self.title = "List".localized()
        
        initTable()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadTable()
    }
    
    func initTable() {
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "listCell")
        
        reloadTable()
    }
    
    func reloadTable() {
        items.loadList()
        tableView.reloadData()
    }
    
    func editRow(index: Int) {
        let selectedItem = items.list[index]
        let name = selectedItem.name
        
        guard let nc = self.navigationController else {
            return
        }
        let vc = ListEditViewController()
        vc.setup(name: name, index: index)
        
        nc.pushViewController(vc, animated: true)
    }
    
    func deleteRow(index: Int) {
        items.removeItem(index: index)
        items.saveList()
        tableView.reloadData()
    }
    
    @objc func addItem(sender: AnyObject) {
        guard let nc = self.navigationController else {
            return
        }
        let vc = ListEditViewController()
        nc.pushViewController(vc, animated: true)
    }

// MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editRow(index: indexPath.row)
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, handler) in
            self?.editRow(index: indexPath.row)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, handler) in
            self?.deleteRow(index: indexPath.row)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
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
