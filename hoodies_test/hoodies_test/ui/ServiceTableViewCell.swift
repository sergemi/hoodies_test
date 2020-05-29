//
//  ServiceTableViewCell.swift
//  hoodies_test
//
//  Created by sergemi on 29.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleTField: UITextField!
    
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var artistTField: UITextField!
    
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryTField: UITextField!
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var priceTField: UITextField!
    
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var companyTField: UITextField!
    
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var yearTField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        localize()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func localize() {
        titleLbl.text = "titleLbl".localized()
        artistLbl.text = "artistLbl".localized()
        countryLbl.text = "countryLbl".localized()
        priceLbl.text = "priceLbl".localized()
        companyLbl.text = "companyLbl".localized()
        yearLbl.text = "yearLbl".localized()
    }
    
}
