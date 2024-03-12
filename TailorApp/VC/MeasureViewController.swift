//
//  MeasureViewController.swift
//  TailorApp
//
//  Created by Razan alshatti on 12/03/2024.
//

import UIKit
import SnapKit

class MeasureViewController: UIViewController {
    
    let measureInfo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subview()
        setupUI()
        AutoLayout()
        
        // Do any additional setup after loading the view.
    }
    
    func subview(){
        
        view.backgroundColor = .white

        view.addSubview(measureInfo)
        
    }
    func setupUI(){
    
        measureInfo.image = UIImage(named: "measurments")
        measureInfo.contentMode = .center
        measureInfo.contentMode = .scaleAspectFit
        
    }
    
    func AutoLayout(){
        measureInfo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}
