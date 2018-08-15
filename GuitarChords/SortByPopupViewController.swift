//
//  SortByPopupViewController.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-15.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// popup with picker to choose how to sort song entries in main view controller

import UIKit

class SortByPopupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let sortByOptions = ["", "Sort By Artist (default)", "Sort By Song Title"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortByOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortByOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NotificationCenter.default.post(name: .sortBy, object: sortByOptions[row])
        self.dismiss(animated: true)
    }
    
}
