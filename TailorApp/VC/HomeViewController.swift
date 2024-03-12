//
//  ViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
        
    }
    func setupNavigationBar(){
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "pencil.and.list.clipboard"),
                style: .plain,
                target: self,
                action: #selector(measureTapped)
                )
            navigationItem.leftBarButtonItem?.tintColor = UIColor.black

        }

        @objc func measureTapped() {
//            let measureVC = MeasureViewController()
//            measureVC.modalPresentationStyle = .popover
//            self.present(measureVC, animated: true)

        }


}

