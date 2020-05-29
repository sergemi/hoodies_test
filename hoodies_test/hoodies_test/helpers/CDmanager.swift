//
//  CDmanager.swift
//  hoodies_test
//
//  Created by sergemi on 29.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import Foundation

protocol CDManagerDelegate {
    func loadingIsComplete()
}

class CDmanager: NSObject, XMLParserDelegate {
    var list: [CDItem] = []
    var delegate: CDManagerDelegate? = nil
    var parser: XMLParser? = nil
    
    var elementName: String = String()
    
    let catalogKey = "CATALOG"
    let cdKey = "CD"
    
    let titleKey = "TITLE"
    let artistKey = "ARTIST"
    let countryKey = "COUNTRY"
    let companyKey = "COMPANY"
    let priceKey = "PRICE"
    let yearKey = "YEAR"
    
    var currentItem = CDItem()
    
    func load(url: String) {
        list = []
        
        DispatchQueue.global().async { [weak self] in
            
            guard let nsurl = URL(string: url) else {
                return
            }
            
            self?.parser = XMLParser(contentsOf: nsurl)
            self?.parser?.delegate = self
            self?.parser?.parse()
        }
    }
    
    func itemsCount() -> Int {
        return list.count
    }
    
    func itemAtIndex(_ index: Int) -> CDItem {
        assert(index < list.count)
        
        return list[index]
    }
    
// MARK: - XMLParserDelegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        self.elementName = elementName
    
        if elementName == cdKey {
            currentItem = CDItem()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == cdKey {
            list.append(currentItem)
        }
        else if elementName == catalogKey {
            DispatchQueue.main.async {[weak self] in
                self?.delegate?.loadingIsComplete()
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if elementName == titleKey {
                currentItem.title += data
            }
            else if elementName == artistKey {
                currentItem.artist += data
            }
            else if elementName == countryKey {
                currentItem.country += data
            }
            else if elementName == companyKey {
                currentItem.company += data
            }
            else if elementName == priceKey {
                currentItem.price += data
            }
            else if elementName == yearKey {
                currentItem.year += data
            }
        }
    }
}
