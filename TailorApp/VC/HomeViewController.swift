//
//  ViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    var tableView = UITableView()
    var image = UIImageView()
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
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    @objc func measureTapped() {
        let measureVC = MeasureViewController()
        measureVC.modalPresentationStyle = .popover
        present(measureVC, animated: true)
    }

    func fetchTailorsData() {
    
        tailors = [
            TailorList(name: "Tailor Qortuba", rating: Double.random(in: 0...5)),
            TailorList(name: "Tailor Kaifan", rating: Double.random(in: 0...5)),
            TailorList(name: "Tailor Yarmouk", rating: Double.random(in: 0...5)),
            TailorList(name: "Tailor Jahra", rating: Double.random(in: 0...5))
        ]
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TailorCell.self, forCellReuseIdentifier: "tailorCell")
        tableView.rowHeight = 140
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
