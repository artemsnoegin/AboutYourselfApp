//
//  UserCardVC.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 04.08.2025.
//

import UIKit

class UserCardVC: UIViewController {
    
    var userCard: Card
    
    let userImage = UIImageView()
    let userName = UILabel()
    let userAge = UILabel()
    let userLocation = UILabel()
    let userHobby = UILabel()
    
    
    init(userCard: Card) {
        self.userCard = userCard
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "About You"
        
        setUpUI()
    }
    
    private func setUpUI() {
        userName.text = "Имя: \(userCard.name ?? "")"
        userAge.text = "Возраст: \(userCard.age ?? 0)"
        userLocation.text = "Локация: \(userCard.location ?? "")"
        userHobby.text = "Хобби: \(userCard.hobby ?? "")"
    
        userImage.image = UIImage(systemName: "person.fill")
        userImage.tintColor = .systemBlue
        userImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userImage)
        userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        userImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        [userName, userAge, userLocation, userHobby].forEach {
            $0.font = .preferredFont(forTextStyle: .largeTitle)
            $0.numberOfLines = 0
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
            
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        }
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            userImage.bottomAnchor.constraint(equalTo: userName.topAnchor, constant: -32),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            userName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            userAge.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8),
            
            userLocation.topAnchor.constraint(equalTo: userAge.bottomAnchor, constant: 8),
            
            userHobby.topAnchor.constraint(equalTo: userLocation.bottomAnchor, constant: 8),
        ])
    
        let rightBarButton = UIBarButtonItem(title: "Restart", image: nil, target: self, action: #selector(restart))
        navigationItem.rightBarButtonItem = rightBarButton
        rightBarButton.tintColor = .red
    }
    
    @objc private func restart() {
        navigationController?.popToRootViewController(animated: true)
    }

}
