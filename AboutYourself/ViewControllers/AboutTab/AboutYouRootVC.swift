//
//  AboutYouRootVC.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 03.08.2025.
//

import UIKit

class AboutYouRootVC: UIViewController {

    private let startButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "About You"
        
        setUpUI()
    }
    
    private func setUpUI() {
        startButton.setTitle("Создать визитку 👤", for: .normal)
        startButton.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        startButton.backgroundColor = .systemBlue.withAlphaComponent(0.4)
        startButton.layer.cornerRadius = 8
        startButton.addTarget(self, action: #selector(createUserCard), for: .touchUpInside)
        
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "About Us", image: nil, target: self, action: #selector(aboutUs))
        
    }
    
    @objc private func createUserCard() {
        navigationController?.pushViewController(EditCardVC(), animated: true)
    }
    
    @objc private func aboutUs() {
        let modalVC = AboutUsVC()
        navigationController?.present(modalVC, animated: true)
    }
}
