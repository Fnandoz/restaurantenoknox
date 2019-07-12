//
//  TextField+Validation.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 12/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func validate() -> Bool {
        if (self.text!.isEmpty || self.text!.count < 3) {
            return false
        }
        return true
    }
}
