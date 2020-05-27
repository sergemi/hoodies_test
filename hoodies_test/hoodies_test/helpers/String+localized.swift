//
//  String+localized.swift
//  hoodies_test
//
//  Created by sergemi on 27.05.2020.
//  Copyright © 2020 sergemi. All rights reserved.
//

import Foundation

extension String {
    func localized(_ comment: String = "") -> String? {
        return NSLocalizedString(self, comment: comment)
    }
}
