//
//  AuthStepsViewController.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 15.03.2024.
//

import UIKit

final class AuthStepsViewController: UIViewController {
    
    private var steps: [AuthStep] = [
        .init(image: UIImage(named: "Step1"), title: "Take research", description: "Research peels very easy without going outside"),
        .init(image: UIImage(named: "Step2"), title: "Monitor your medication intake", description: "Keep your medication diary conveniently"),
        .init(image: UIImage(named: "Step3"), title: "Shop quickly", description: "Buy medicines in the most convenient and fastest way"),
    ]
    
    private var currentItem = 0
    
    private lazy var collectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 450)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.dataSource = self
        view.delegate = self
        view.isPagingEnabled = true
        view.register(AuthStepCell.self, forCellWithReuseIdentifier: "AuthStep")
        view.isUserInteractionEnabled = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .init(hex: "#7362D7")
        return view
    }()
    
    private lazy var pageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = steps.count
        return pageControl
    }()
    
    private lazy var nextButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        button.backgroundColor = .init(hex: "#6562CE")
        return button
    }()
    
    private lazy var skipButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(skipButtonDidTap), for: .touchUpInside)
        button.backgroundColor = .systemGray
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @objc
    private func nextButtonDidTap() {
        if currentItem + 1 < steps.count {
            currentItem += 1
            pageControl.currentPage = currentItem
            let rect = collectionView.layoutAttributesForItem(at: IndexPath(row: currentItem, section: 0))?.frame
            collectionView.scrollRectToVisible(rect!, animated: true)
        } else {
            let viewController = UIViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @objc
    private func skipButtonDidTap() {
        let viewController = UIViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setup() {
        view.backgroundColor = .init(hex: "#7362D7")
        [collectionView, pageControl, nextButton, skipButton].forEach { view.addSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        skipButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-32)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(32)
        }
        nextButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(skipButton)
            make.bottom.equalTo(skipButton.snp.top).offset(-16)
            make.height.equalTo(32)
        }
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-32)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(64)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(pageControl.snp.top).offset(-16)
        }
    }
}

extension AuthStepsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        steps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthStep", for: indexPath) as! AuthStepCell
        cell.configure(with: steps[indexPath.row])
        return cell
    }
}
