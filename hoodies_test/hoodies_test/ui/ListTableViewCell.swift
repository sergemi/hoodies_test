//
//  ListTableViewCell.swift
//  hoodies_test
//
//  Created by sergemi on 27.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    
    var listViewControllerDelegate: ListViewControllerDelegate? = nil
    var rowIndex: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ name: String, checked: Bool = false) {
        nameLbl.text = name
        checkBox.isSelected = checked
        
        updateChecked()
    }
    
    func setupFromItem(_ item: listItem) {
        setup(item.name, checked: item.checked)
    }
    
    @IBAction func onCheckBox(_ sender: Any) {
        checkBox.isSelected = !checkBox.isSelected
        listViewControllerDelegate?.changeCheckedState(checked: checkBox.isSelected, index: rowIndex)
        updateChecked()
    }
    
    fileprivate func updateChecked() {
        icon.image = checkBox.isSelected ? UIImage(named: "dog") : UIImage(named: "cat")
    }
}
