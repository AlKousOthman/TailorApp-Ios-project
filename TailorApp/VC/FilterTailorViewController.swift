//
//  FilterTailorViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import UIKit
import Eureka

class TailorFilterViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Filter ")
            <<< SegmentedRow<String>("gender"){ row in
                row.title = "Gender"
                row.options = ["Male", "Female"]
                row.value = "Male"
            }
        <<< ActionSheetRow<String>("number") { row in
                        row.title = "Choose a number of days"
                        row.selectorTitle = "Pick a number from 1 to 7"
                        row.options = ["1", "2", "3", "4", "5", "6", "7"]
                        row.value = "1"
                    }
        <<< SegmentedRow<String>("yes_no") { row in
                        row.title = "Do you need consultation?"
                        row.options = ["Yes", "No"]
                        row.value = "Yes"
                    }
        <<< ActionSheetRow<String>("clothing") { row in
            row.title = "Clothing Type"
            row.selectorTitle = "Choose a type"
            row.options = ["Dress", "Dishdasha", "Pants", "Top"]
            row.value = "Dress"
        }
        
        <<< ButtonRow(){ row in
            row.title = "Filter"
            row.onCellSelection{ cell , row in
                
                self.submitTapped()
            }
        }
    }

    @objc func submitTapped(){}
}
