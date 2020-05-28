//
//  ListEditViewController.swift
//  hoodies_test
//
//  Created by sergemi on 28.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import UIKit

class ListEditViewController: UIViewController {
    
    @IBOutlet weak var nameTField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var revertBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var editIndex: Int = -1
    var initialName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTField.placeholder = "Item Name".localized()
        doneBtn.setTitle("Done".localized(), for: .normal)
        doneBtn.setTitle("Done".localized(), for: .highlighted)
        
        revertBtn.setTitle("Revert".localized(), for: .normal)
        revertBtn.setTitle("Revert".localized(), for: .highlighted)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
        title: "Back".localized(), style: .plain, target: self, action: #selector(ListEditViewController.onBack(sender:)))
        
        nameTField.text = initialName
        
        updateDoneAvailability()
    }
    
    func setup(name: String, index:Int = -1) {
        editIndex = index
        initialName = name
    }
    
    func saveChanges() {
        if editIndex == -1 {
            addNew()
        }
        else {
            editCurrent()
        }
    }

    @IBAction func onDone(_ sender: Any) {
        saveChanges()
        goBack()
    }
    
    @IBAction func onRevert(_ sender: Any) {
        goBack()
    }
    
    @IBAction func onNameChanged(_ sender: Any) {
        updateDoneAvailability()
    }
    
    
    @objc func onBack(sender: UIBarButtonItem) {
        if nameTField.text != initialName {
            let alert = UIAlertController(title: "Data changed".localized(),
                                          message: "Save changes?".localized(),
                                          preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes".localized(), style: .default, handler: { [weak self] (action: UIAlertAction!) in
                self?.saveChanges()
                self?.goBack()
              }))


            alert.addAction(UIAlertAction(title: "No".localized(), style: .cancel, handler: { [weak self] (action: UIAlertAction!) in
                self?.goBack()
              }))

            present(alert, animated: true, completion: nil)
        }
        else {
            goBack()
        }
    }
    
    func goBack() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func updateDoneAvailability() {
        doneBtn.isEnabled = nameTField.text != initialName
    }
    
    func addNew() {
        let items = Items()
        items.loadList()
        items.addItem(nameTField.text!)
    }
    
    func editCurrent() {
        let items = Items()
        items.loadList()
        items.changeName(nameTField.text!, index: editIndex)
    }
}
