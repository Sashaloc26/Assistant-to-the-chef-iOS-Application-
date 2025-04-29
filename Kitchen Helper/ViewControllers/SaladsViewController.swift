//
//  SaladsViewController.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import UIKit
import SnapKit
import RealmSwift

class SaladsViewController: BaseViewController {
    let viewModelSalads = SaladsViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    let gradientLayer = CAGradientLayer()
    
    let searchButton = SearchButton()
    let backButton = BackButton()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Salads"
        label.textColor = .white
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.textColor = .black
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let collectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Salads"
        label.textColor = .black
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let layout = UICollectionViewFlowLayout()
    var categoryProductsCollectionView: UICollectionView!
    
    var categoryProductsContents: [CategoryProducts] = CategoryProducts.allCategoryProductsContents()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 0.7)
        return view
    }()
    
    var catalogRecipeCollectionView: UICollectionView!
    let catalogLayout = UICollectionViewFlowLayout()
    
    var isFiltered = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        
        categoryProductsCollectionView.reloadData()
        viewModelSalads.$recipesSalads
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.catalogRecipeCollectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModelSalads.getSaladsRecipes(categoryName: "Salads") {}
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
        view.addSubview(ingredientsLabel)
        view.addSubview(categoryProductsCollectionView)
        view.addSubview(lineView)
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
        
        ingredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(20)
        }
        
        categoryProductsCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(ingredientsLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(categoryProductsCollectionView.snp.bottom).offset(20)
            make.height.equalTo(4)
        }
        
        collectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(ingredientsLabel.snp.leading)
            make.top.equalTo(lineView.snp.bottom).offset(30)
        }
        
        catalogRecipeCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalTo(collectionTitleLabel.snp.bottom).offset(20)
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

extension SaladsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryProductsCollectionView {
            return categoryProductsContents.count
            
        } else if collectionView == catalogRecipeCollectionView {
            return viewModelSalads.recipesSalads.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryProductsCollectionView {
            guard let cell = categoryProductsCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesProductsCell", for: indexPath) as? CategoriesProductsCell else {
                fatalError("Unable to dequeue CategoriesProductsCell")
            }
            
            let content = categoryProductsContents[indexPath.item]
            cell.configure(image: content.categoryProductsImage)
            
            let shadowPathRect = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
            
            cell.layer.borderWidth = 0.3
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.shadowPath = UIBezierPath(rect: shadowPathRect).cgPath
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize.zero
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowRadius = 5.0
            cell.layer.masksToBounds = false
            
            return cell
            
        } else if collectionView == catalogRecipeCollectionView {
            guard let cell = catalogRecipeCollectionView.dequeueReusableCell(withReuseIdentifier: "CatalogRecipesCollectionCell", for: indexPath) as? CatalogRecipesCollectionCell else {
                fatalError("Unable to dequeue CategoriesProductsCell")
            }
            
            let recipe = viewModelSalads.recipesSalads[indexPath.item]
            
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
        fatalError("Unexpected collection view")
    }
}

extension SaladsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryProductsCollectionView {
            if indexPath.item == 0 {
                if isFiltered {
                    isFiltered = false
                    viewModelSalads.filterRecipesByIngredient("Pork")
                } else {
                    isFiltered = true
                    viewModelSalads.getSaladsRecipes(categoryName: "Salads") {}
                }
            } else if indexPath.item == 1{
                if isFiltered {
                    isFiltered = false
                    viewModelSalads.filterRecipesByIngredient("Fish")
                } else {
                    isFiltered = true
                    viewModelSalads.getSaladsRecipes(categoryName: "Salads") {}
                }
            } else if indexPath.item == 2 {
                if isFiltered {
                    isFiltered = false
                    viewModelSalads.filterRecipesByIngredient("Chicken")
                } else {
                    isFiltered = true
                    viewModelSalads.getSaladsRecipes(categoryName: "Salads") {}
                }
            } else if indexPath.item == 3 {
                if isFiltered {
                    isFiltered = false
                    viewModelSalads.filterRecipesByIngredient("Vegetables")
                } else {
                    isFiltered = true
                    viewModelSalads.getSaladsRecipes(categoryName: "Salads") {}
                }
            } else if indexPath.item == 4 {
                if isFiltered {
                    isFiltered = false
                    viewModelSalads.filterRecipesByIngredient("Mushrooms")
                } else {
                    isFiltered = true
                    viewModelSalads.getSaladsRecipes(categoryName: "Salads") {}
                }
            }
                        
        } else if collectionView ==  catalogRecipeCollectionView  {
            let soupRecipe = viewModelSalads.recipesSalads[indexPath.row]
            let nextController = FullInfoRecipeController()
            nextController.recipe = soupRecipe
            navigationController?.pushViewController(nextController, animated: true)
        }
    }
}

extension SaladsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryProductsCollectionView {
            categoryProductsCollectionView.superview?.setNeedsLayout()
            categoryProductsCollectionView.superview?.layoutIfNeeded()
            
            return CGSize(width: categoryProductsCollectionView.bounds.width * 0.15, height: categoryProductsCollectionView.bounds.height)
            
        } else if collectionView == catalogRecipeCollectionView && UIScreen.main.bounds.height <= 568 {
            catalogRecipeCollectionView.superview?.setNeedsLayout()
            catalogRecipeCollectionView.superview?.layoutIfNeeded()
            
            return CGSize(width: catalogRecipeCollectionView.bounds.width, height: catalogRecipeCollectionView.bounds.height * 0.6)
            
        } else {
            return CGSize(width: catalogRecipeCollectionView.bounds.width, height: catalogRecipeCollectionView.bounds.height * 0.35)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == catalogRecipeCollectionView {
            return 30
        }
        return 0
    }
}


