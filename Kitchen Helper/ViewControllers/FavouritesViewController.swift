//
//  FavouritesViewController.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 29/01/2024.
//

import UIKit
import SnapKit

class FavouritesViewController: BaseViewController {
    let viewModel = FavouritesViewModel()
    
    let gradientLayer = CAGradientLayer()
    
    let searchButton = SearchButton()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorites"
        label.textColor = .white
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    var catalogRecipeCollectionView: UICollectionView!
    let catalogLayout = UICollectionViewFlowLayout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getFavouritesRecipe() {
            DispatchQueue.main.async {
                self.catalogRecipeCollectionView.reloadData()
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width / 4.5)
        gradientLayer.colors = [UIColor(red: 250/255, green: 173/255, blue: 91/255, alpha: 1.0).cgColor,
                                UIColor(red: 247/255, green: 65/255, blue: 114/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.6, y: 0.6)
        
        searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
        catalogRecipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: catalogLayout)
        catalogRecipeCollectionView.register(CatalogRecipesCollectionCell.self, forCellWithReuseIdentifier: "CatalogRecipesCollectionCell")
        catalogRecipeCollectionView.dataSource = self
        catalogRecipeCollectionView.delegate = self
        catalogRecipeCollectionView.backgroundColor = .clear
        
        view.layer.addSublayer(gradientLayer)
        view.addSubview(searchButton)
        view.addSubview(titleLabel)
        view.addSubview(catalogRecipeCollectionView)
        
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(2)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.top).offset(-2)
            make.centerX.equalToSuperview()
        }
        
        catalogRecipeCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func searchAction() {
        let searchController = SeacrhViewController()
        navigationController?.pushViewController(searchController, animated: true)
    }
}

extension FavouritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favouritesRecipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = catalogRecipeCollectionView.dequeueReusableCell(withReuseIdentifier: "CatalogRecipesCollectionCell", for: indexPath) as? CatalogRecipesCollectionCell else {
            fatalError("Unable to dequeue CategoriesProductsCell")
        }
        
        let recipe = viewModel.favouritesRecipes[indexPath.item]
        if let photoName = recipe.photo, let avatar = UIImage(named: photoName) {
            let title = recipe.name
            let description = recipe.ingredients
            let calories = recipe.calories
            let time = recipe.cookingTime
            let isFavourite = recipe.favourites
            
            cell.configure(title: title, image: avatar, description: description, calories: calories, time: time, isFavourite: isFavourite)
        }
        cell.applyShadow()
        
        return cell
    }
}

extension FavouritesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favouritesRecipes = viewModel.favouritesRecipes[indexPath.item]
        let nextController = FullInfoRecipeController()
        nextController.recipe = favouritesRecipes
        navigationController?.pushViewController(nextController, animated: true)
    }
}

extension FavouritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        catalogRecipeCollectionView.superview?.setNeedsLayout()
        catalogRecipeCollectionView.superview?.layoutIfNeeded()
        
        return CGSize(width: catalogRecipeCollectionView.bounds.width, height: catalogRecipeCollectionView.bounds.height * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

