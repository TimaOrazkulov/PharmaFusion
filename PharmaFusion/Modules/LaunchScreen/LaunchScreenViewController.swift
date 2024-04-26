//
//  LaunchScreenViewController.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 15.03.2024.
//

import UIKit
import SnapKit

final class LaunchScreenViewController: UIViewController {
    
    private lazy var logoImageView = UIImageView(image: UIImage(named: "Logo"))

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigateToIntro()
    }

    private func setup() {
        view.backgroundColor = .init(hex: "#7362D7")
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 336, height: 300))
        }
    }
    
    private func navigateToIntro() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigationController?.pushViewController(AuthIntroViewController(), animated: true)
        }
    }
}
