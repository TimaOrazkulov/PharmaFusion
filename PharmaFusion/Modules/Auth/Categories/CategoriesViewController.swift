//
//  CategoriesViewController.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 05.04.2024.
//

import UIKit

final class CategoriesViewController: UIViewController {
    
    private var categories: [Category] = [
        .init(title: "Personal hygiene", image: URL(fileURLWithPath: "")),
        .init(title: "Medicine", image: URL(fileURLWithPath: "")),
        .init(title: "Dietary supplements", image: URL(fileURLWithPath: "")),
        .init(title: "Emergency items", image: URL(fileURLWithPath: "")),
        .init(title: "Newborns", image: URL(fileURLWithPath: "")),
        .init(title: "Masks, bandages and syringes", image: URL(fileURLWithPath: ""))
    ] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subtitleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var collectionView = UICollectionView()
    
    private lazy var actionButton = {
        let button = UIButton()
        button.backgroundColor = .init(hex: "#543BD6")
        button.layer.cornerRadius = 20
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(actionButtonDidTap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar(isHidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        configureNavigationBar(isHidden: false)
    }
    
    @objc
    private func actionButtonDidTap() {
        let viewController = GoalsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func configureNavigationBar(isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
    }
    
    private func setup() {
        view.backgroundColor = .init(hex: "#7362D7")
        [titleLabel, subtitleLabel, collectionView, actionButton].forEach { view.addSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        actionButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.size.equalTo(
                CGSize(width: 178, height: 40)
            )
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(actionButton.snp.top).offset(-16)
        }
    }
    
    func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 28
        layout.itemSize = .init(width: 150, height: 150)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "Category")
        collectionView.dataSource = self

        return collectionView
    }
}

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as! CategoryCell
        cell.delegate = self
        cell.configure(with: categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
}

extension CategoriesViewController: CategoryCellDelegate {
    func didSelectCategory(_ cell: CategoryCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        
        categories[indexPath.item].isSelected.toggle()
    }
}
