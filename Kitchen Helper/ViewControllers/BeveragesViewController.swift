//
//  BeveragesViewController.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import UIKit
import SnapKit
import RealmSwift
import Combine

class BeveragesViewController: BaseViewController {
    let viewModelBeverage = BeveragesViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    let gradientLayer = CAGradientLayer()
    
    let searchButton = SearchButton()
    let backButton = BackButton()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Напитки"
        label.textColor = .white
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let collectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Напитки"
        label.textColor = .black
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let layout = UICollectionViewFlowLayout()
    var categoryProductsCollectionView: UICollectionView!
    
    var categoryProductsContents: [CategoryProducts] = CategoryProducts.allCategoryProductsContents()
    
    var catalogRecipeCollectionView: UICollectionView!
    let catalogLayout = UICollectionViewFlowLayout()
    
    var isFiltered = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        
        categoryProductsCollectionView.reloadData()
         viewModelBeverage.$recipesBeverages
            .receive(on: DispatchQueue.main)
            .sink { [weak self ] _ in
                self?.catalogRecipeCollectionView.reloadData()
            }
            .store(in: &cancellables)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModelBeverage.getBeveragesRecipes(categoryName: "Beverages") {}
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width / 4.5)
        gradientLayer.colors = [UIColor(red: 250/255, green: 173/255, blue: 91/255, alpha: 1.0).cgColor,
                                UIColor(red: 247/255, green: 65/255, blue: 114/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.6, y: 0.6)
        
        
        backButton.addTarget(self, action: #selector(backButtonAction) , for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
        categoryProductsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        categoryProductsCollectionView.register(CategoriesProductsCell.self, forCellWithReuseIdentifier: "CategoriesProductsCell")
        categoryProductsCollectionView.dataSource = self
        categoryProductsCollectionView.delegate = self
        categoryProductsCollectionView.backgroundColor = .clear
        
        catalogRecipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: catalogLayout)
        catalogRecipeCollectionView.register(CatalogRecipesCollectionCell.self, forCellWithReuseIdentifier: "CatalogRecipesCollectionCell")
        catalogRecipeCollectionView.dataSource = self
        catalogRecipeCollectionView.delegate = self
        catalogRecipeCollectionView.backgroundColor = .clear
        
        view.layer.addSublayer(gradientLayer)
        view.addSubview(searchButton)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(categoryProductsCollectionView)
        view.addSubview(collectionTitleLabel)
        view.addSubview(catalogRecipeCollectionView)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(2)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(2)
            make.leading.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top).offset(-2)
            make.centerX.equalToSuperview()
        }
        
        collectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        catalogRecipeCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func searchAction() {
        let searchController = SearchViewController()
        navigationController?.pushViewController(searchController, animated: true)
    }
}

extension BeveragesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelBeverage.recipesBeverages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = catalogRecipeCollectionView.dequeueReusableCell(withReuseIdentifier: "CatalogRecipesCollectionCell", for: indexPath) as? CatalogRecipesCollectionCell else {
            fatalError("Unable to dequeue CategoriesProductsCell")
        }
        
        let recipe = viewModelBeverage.recipesBeverages[indexPath.item]
        
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

extension BeveragesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let soupRecipe = viewModelBeverage.recipesBeverages[indexPath.row]
        let nextController = FullInfoRecipeController()
        nextController.recipe = soupRecipe
        navigationController?.pushViewController(nextController, animated: true)
    }
}

extension BeveragesViewController: UICollectionViewDelegateFlowLayout {
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



