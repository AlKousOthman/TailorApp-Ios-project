//
//  ViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import UIKit


struct TailorList {
    let name: String
    let rating: Double
    let profileImage: UIImage
    
}

class HomeViewController: UIViewController {
    
    var tableView = UITableView()
        var tailors: [TailorList] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            setupNavigationBar()
            setupTableView()
            fetchTailorsData()
        }

        func setupNavigationBar() {
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
            let measureVC = MeasureViewController()
            measureVC.modalPresentationStyle = .popover
            present(measureVC, animated: true)
        }

        func fetchTailorsData() {
            // Dummy data
            tailors = [
                TailorList(name: "tailor 1", rating: Double.random(in: 0...5), profileImage: UIImage(named: "tailor1")!),
                TailorList(name: "tailor 2", rating: Double.random(in: 0...5), profileImage: UIImage(named: "tailor2")!),
                TailorList(name: "tailor 3", rating: Double.random(in: 0...5), profileImage: UIImage(named: "tailor3")!),
                TailorList(name: "tailor 4", rating: Double.random(in: 0...5), profileImage: UIImage(named: "tailor4")!)
                
            ]
        }

        func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(TailorCell.self, forCellReuseIdentifier: "tailorCell")
            tableView.rowHeight = 140 // Increase cell height
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }

    extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tailors.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tailorCell", for: indexPath) as! TailorCell
            let tailor = tailors[indexPath.row]
            cell.configure(with: tailor)
            return cell
        }
    }
    
    
    
//    var tableView = UITableView()
//        var tailors: [TailorList] = []
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        setupNavigationBar()
//        setupTableView()
//        fetchTailorsData()
//    }
//    
//    func setupNavigationBar() {
//           let appearance = UINavigationBarAppearance()
//           appearance.configureWithDefaultBackground()
//           navigationController?.navigationBar.scrollEdgeAppearance = appearance
//           navigationItem.leftBarButtonItem = UIBarButtonItem(
//               image: UIImage(systemName: "pencil.and.list.clipboard"),
//               style: .plain,
//               target: self,
//               action: #selector(measureTapped)
//           )
//           navigationItem.leftBarButtonItem?.tintColor = UIColor.black
//       }
//
//       @objc func measureTapped() {
//           let measureVC = MeasureViewController()
//           measureVC.modalPresentationStyle = .popover
//           present(measureVC, animated: true)
//       }
//
//       func fetchTailorsData() {
//           // Dummy data
//           tailors = [
//               TailorList(name: "tailor 1", rating: 4.5, profileImage: UIImage(named: "tailor1")!),
//               TailorList(name: "tailor 2", rating: 4.8, profileImage: UIImage(named: "tailor2")!),
//               TailorList(name: "tailor 3", rating: 3.9, profileImage: UIImage(named: "tailor3")!),
//               TailorList(name: "tailor 4", rating: 4.2, profileImage: UIImage(named: "tailor4")!)
//               // Add more tailor data as needed
//           ]
//       }
//
//       func setupTableView() {
//           tableView.delegate = self
//           tableView.dataSource = self
//           tableView.register(TailorCell.self, forCellReuseIdentifier: "tailorCell")
//           tableView.rowHeight = 120 // Increase cell height
//           view.addSubview(tableView)
//           tableView.translatesAutoresizingMaskIntoConstraints = false
//           NSLayoutConstraint.activate([
//               tableView.topAnchor.constraint(equalTo: view.topAnchor),
//               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//               tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//           ])
//       }
//   }
//
//   extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           return tailors.count
//       }
//
//       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           let cell = tableView.dequeueReusableCell(withIdentifier: "tailorCell", for: indexPath) as! TailorCell
//           let tailor = tailors[indexPath.row]
//           cell.configure(with: tailor)
//           return cell
//       }
//   }
//  
