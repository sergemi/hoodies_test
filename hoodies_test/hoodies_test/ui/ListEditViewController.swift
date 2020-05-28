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

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTField.placeholder = "Item Name".localized()
        doneBtn.setTitle("Done".localized(), for: .normal)
        doneBtn.setTitle("Done".localized(), for: .highlighted)
        
        revertBtn.setTitle("Revert".localized(), for: .normal)
        revertBtn.setTitle("Revert".localized(), for: .highlighted)
        
        backBtn.setTitle("Back".localized(), for: .normal)
        backBtn.setTitle("Back".localized(), for: .highlighted)
    }

    @IBAction func onDone(_ sender: Any) {
        print("onDone")
    }
    
    @IBAction func onRevert(_ sender: Any) {
        print("onRevert")
    }
    
    @IBAction func onBack(_ sender: Any) {
        print("onBack")
    }
}
