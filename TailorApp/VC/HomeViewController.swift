//
//  ViewController.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import UIKit
import SnapKit

// Snapkit?
// TableView?

struct TailorList {
    let name: String
    let rating: Double
    let profileImage: UIImage
}

class HomeViewController: UIViewController, UISearchBarDelegate {

    var tableView = UITableView()
    var tailors: [TailorList] = []
    var tailorsSearch: [Tailor] = []
    var filteredTailors: [Tailor] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
        setupTableView()
        fetchTailorsData()
        setupNavigationBar()
        setupSearchBar()
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Tailor"
        self.tabBarController?.navigationItem.searchController = searchController
        self.tabBarController?.navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
    }
    
   
    
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.tabBarController?.navigationItem.leftBarButtonItem  = UIBarButtonItem(
            image: UIImage(systemName: "pencil.and.list.clipboard"),
            style: .plain,
            target: self,
            action: #selector(measureTapped)
        )
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
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

extension HomeViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredTailors = tailorsSearch.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        } else {
            filteredTailors = tailorsSearch
        }
        tableView.reloadData()
    }
    
//    overide func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        
//        
//    }
    
}
