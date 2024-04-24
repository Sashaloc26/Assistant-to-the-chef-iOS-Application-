//
//  SeacrhViewController.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 17/04/2024.
//

import UIKit
import SnapKit

class SeacrhViewController: BaseViewController {
    let viewModel = SearchViewModel()
    
    let gradientLayer = CAGradientLayer()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder  = "Search for recipes"
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        return searchBar
    }()
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    let backButton = BackButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
    }
    
    override func setupViews() {
        super.setupViews()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 250/255, green: 173/255, blue: 91/255, alpha: 1.0).cgColor,
                                UIColor(red: 247/255, green: 65/255, blue: 114/255, alpha: 1.0).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.6, y: 0.6)
        
        backButton.addTarget(self, action: #selector(backButtonAction) , for: .touchUpInside)
        
        searchBar.delegate = self
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
        view.layer.addSublayer(gradientLayer)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(backButton)
        
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalTo(searchBar.snp.top).offset(-10)
        }
    }
    
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension SeacrhViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(performSearch), object: nil)
        perform(#selector(performSearch), with: nil, afterDelay: 0.1)
    }
    
    @objc func performSearch() {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            viewModel.clearSearchResults()
            tableView.reloadData()
            return
        }
        
        viewModel.findRecipes(searchText) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension SeacrhViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            fatalError("Unable to dequeue CategoriesProductsCell")
        }
        let results = viewModel.searchResults[indexPath.row]
        
        let resultsName = results.name
        cell.configure(resultsName)
        return cell
    }
}

extension SeacrhViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = viewModel.searchResults[indexPath.row]
        let nextController = FullInfoRecipeController()
        nextController.recipe = result
        navigationController?.pushViewController(nextController, animated: true)
    }
}
