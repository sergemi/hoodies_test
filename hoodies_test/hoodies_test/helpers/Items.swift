//
//  Items.swift
//  hoodies_test
//
//  Created by sergemi on 28.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import Foundation

class Items {
    let listKey = "listNames"
    
    var list: [listItem] = []
    
    func loadList() {
        let defaults = UserDefaults.standard
        
        if let data = defaults.data(forKey: listKey) {
            list = try! PropertyListDecoder().decode([listItem].self, from: data)
        }
    }
    
    func saveList() {
        let defaults = UserDefaults.standard
        if let data = try? PropertyListEncoder().encode(list) {
            defaults.set(data, forKey: listKey)
        }
    }
    
    func addItem(_ name: String, checked: Bool = false) {
        let item = listItem(name: name, checked: checked)
        list.append(item)
        saveList()
    }
    
    func changeName(_ name: String, index: Int) {
        list[index].name = name
        saveList()
    }
    
    func removeItem(index: Int) {
        if index >= list.count {
            return
        }
        
        list.remove(at: index)
        saveList()
    }
}
