//
//  FullInfoRecipeController.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/02/2024.
//

import UIKit
import SnapKit

class FullInfoRecipeController: BaseViewController {
    
    let gradientLayer = CAGradientLayer()
    
    let backButton = BackButton()
    let searchButton = SearchButton()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Первые блюда"
        label.textColor = .white
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 20, weight: .semibold)
        return label
    }()
    
    let nameReciepLabel: UILabel = {
        let label = UILabel()
        label.text = "Борщ"
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
        button.backgroundColor = .lightGray
        return button
    }()
    
    let heartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .white
        return imageView
    }()
    
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
        
        backButton.addTarget(self, action: #selector(backButtonAction) , for: .touchUpInside)
        
        avatarImageView.contentMode = .scaleToFill
        
        whiteView.layer.cornerRadius = 100
        whiteView.layer.maskedCorners = [.layerMinXMinYCorner]
        
        tableView.register(RecipeTableCell.self, forCellReuseIdentifier: "RecipeTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
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
            make.top.equalTo(view.safeAreaLayoutGuide).offset(29)
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
            make.top.equalTo(nameReciepLabel.snp.bottom).offset(30)
            make.leading.equalTo(nameReciepLabel.snp.leading)
            make.trailing.equalTo(view.snp.trailing).offset(30)
            make.bottom.equalTo((view.safeAreaLayoutGuide))
        }
    }
    
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension FullInfoRecipeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableCell", for: indexPath) as? RecipeTableCell else {
            fatalError("Unable to dequeue RecipeTableCell")
        }
        return cell
    }
}

extension FullInfoRecipeController: UITableViewDelegate {
    
}
