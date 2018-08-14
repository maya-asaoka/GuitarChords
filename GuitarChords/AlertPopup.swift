//
//  AlertPopup.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-14.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class AlertPopup {
    
    class func showErrorMessage(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
}
