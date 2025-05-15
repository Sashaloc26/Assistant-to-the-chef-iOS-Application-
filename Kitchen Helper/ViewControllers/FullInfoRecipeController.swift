//
//  FullInfoRecipeController.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/02/2024.
//

import UIKit
import SnapKit

class FullInfoRecipeController: BaseViewController, RecipeTableCellDelegate {
    let viewModel = FullInfoRecipeViewModel()
    
    let gradientLayer = CAGradientLayer()
    
    var recipe: Recipe?
    
    let backButton = BackButton()
    let searchButton = SearchButton()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let nameReciepLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "borsh")
        return imageView
    }()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let heartButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 30
        return button
    }()
    
    let heartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .white
        return imageView
    }()
    
    var isHeartButtonSelected = false
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width / 4.5)
        gradientLayer.colors = [UIColor(red: 250/255, green: 173/255, blue: 91/255, alpha: 1.0).cgColor,
                                UIColor(red: 247/255, green: 65/255, blue: 114/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.6, y: 0.6)
        
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        heartButton.addTarget(self, action: #selector(heartButtonAction), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
        avatarImageView.contentMode = .scaleToFill
        
        whiteView.layer.cornerRadius = 100
        whiteView.layer.maskedCorners = [.layerMinXMinYCorner]
        
        tableView.register(RecipeTableCell.self, forCellReuseIdentifier: "RecipeTableCell")
        tableView.register(RecipeDescriptionCell.self, forCellReuseIdentifier: "RecipeDescriptionCell")
        tableView.register(LineTableCell.self, forCellReuseIdentifier: "LineTableCell")
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0.01
        tableView.sectionFooterHeight = 0.01
        tableView.contentInsetAdjustmentBehavior = .never
        
        avatarImageView.image = UIImage(named: recipe?.photo ?? "")
        nameReciepLabel.text = recipe?.name
        titleLabel.text = recipe?.name
        
        if recipe?.favourites == true {
            heartButton.backgroundColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 1)
        } else {
            heartButton.backgroundColor = .lightGray
        }
        
        view.layer.addSublayer(gradientLayer)
        view.addSubview(backButton)
        view.addSubview(searchButton)
        view.addSubview(titleLabel)
        view.addSubview(avatarImageView)
        view.addSubview(whiteView)
        view.addSubview(nameReciepLabel)
        view.addSubview(heartButton)
        view.addSubview(tableView)
        heartButton.addSubview(heartImage)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(2)
            make.leading.equalToSuperview().offset(10)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(2)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top).offset(-2)
            make.leading.equalTo(backButton.snp.trailing).offset(10)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(28)
            make.bottom.equalTo(view.snp.centerY).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
        
        whiteView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.centerY).offset(-100)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        nameReciepLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(50)
            make.top.equalTo(whiteView.snp.top).offset(60)
        }
        
        heartButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-30)
            make.centerY.equalTo(whiteView.snp.top)
            make.width.height.equalTo(60)
        }
        
        heartImage.snp.makeConstraints { make in
            make.centerX.equalTo(heartButton)
            make.centerY.equalTo(heartButton)
            make.width.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(nameReciepLabel.snp.bottom)
            make.leading.equalTo(backButton.snp.leading)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func searchAction() {
        let searchController = SearchViewController()
        present(searchController, animated: true)
    }
    
    @objc func heartButtonAction(sender: UIButton) {
        if sender.backgroundColor == .lightGray {
            viewModel.addToFavourites(recipe: recipe)
            sender.backgroundColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 1)
        } else {
            viewModel.deleteFromFavourites(recipe: recipe)
            sender.backgroundColor = .lightGray
        }
    }
    
    func didTapPlusButton(in cell: RecipeTableCell) {
        guard tableView.indexPath(for: cell) != nil else { return }
    }
}

extension FullInfoRecipeController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 40 : 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return recipe?.ingredients.count ?? 0
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableCell", for: indexPath) as? RecipeTableCell {
                if let ingredient = recipe?.ingredients[indexPath.row] {
                    cell.configure(with: ingredient)
                } else {
                    cell.configure(with: "")
                }
                cell.delegate = self
                return cell
            } else {
                return UITableViewCell()
            }
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableCell", for: indexPath) as? LineTableCell
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeDescriptionCell", for: indexPath) as? RecipeDescriptionCell
            cell?.configure(description: recipe?.instructions ?? "")
            return cell ?? UITableViewCell()
        }
    }
}

