//
//  ListViewController.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 29/01/2024.
//

import UIKit
import SnapKit

class ListViewController: BaseViewController{
    let viewModel = ListViewModel()
    
    let gradientLayer = CAGradientLayer()
    
    let searchButton = SearchButton()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Shopping list"
        label.textColor = .white
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 30
        button.backgroundColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 1)
        return button
    }()
    
    let plusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.tintColor = .white
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPurchaseList() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        setupViews()
        makeConstraints()
        
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        whiteView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.centerY).offset(-100)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(2)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.top).offset(-2)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
            make.top.bottom.equalToSuperview().inset(110)
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-50)
            make.centerY.equalTo(tableView.snp.bottom)
            make.width.height.equalTo(60)
        }
        
        plusImage.snp.makeConstraints { make in
            make.centerX.equalTo(plusButton)
            make.centerY.equalTo(plusButton)
            make.width.height.equalTo(45)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1)
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 250/255, green: 173/255, blue: 91/255, alpha: 1.0).cgColor,
                                UIColor(red: 247/255, green: 65/255, blue: 114/255, alpha: 1.0).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.6, y: 0.6)
        
        whiteView.layer.cornerRadius = 100
        whiteView.layer.maskedCorners = [.layerMinXMinYCorner]
        
        searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        tableView.backgroundColor = .white
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOffset = CGSize.zero
        tableView.layer.shadowOpacity = 0.2
        tableView.layer.shadowRadius = 5.0
        tableView.layer.masksToBounds = false
        
        plusButton.addTarget(self, action: #selector(addPurchase), for: .touchUpInside)
        
        
        view.layer.addSublayer(gradientLayer)
        view.addSubview(whiteView)
        view.addSubview(searchButton)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(plusButton)
        plusButton.addSubview(plusImage)
    }
    
    @objc func searchAction() {
        let searchController = SeacrhViewController()
        navigationController?.pushViewController(searchController, animated: true)
    }
    
    @objc func addPurchase() {
        let alertController = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Текст"
        }
        let submitAction = UIAlertAction(title: "Готово", style: .default) { [weak self] _ in
            guard let text = alertController.textFields?.first?.text else { return }
            self?.viewModel.addPurchase(purchase: text)
            self?.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.purchaseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            fatalError("Unable to dequeue CategoriesProductsCell")
        }
        
        let purchase = viewModel.purchaseList[indexPath.row]
        
        cell.configure(with: purchase.name)
        
        cell.trashButton.tag = indexPath.row
        cell.trashButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        let purchaseList = viewModel.purchaseList
        let purchase = purchaseList[index]
        
        PurchaseListManager.shared.deletePurchase(purchase)
        viewModel.getPurchaseList {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

