//
//  NameVC.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 03.08.2025.
//

import UIKit

class NameVC: UIViewController {
    
    var story: String
    
    private let storyLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let nameField = UITextField()
    private let warningLabel = UILabel()
    private let continueButton = UIButton(configuration: .gray())
    
    
    init(story: String) {
        self.story = story
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Name"
        
        setUpUI()
    }
    
    private func setUpUI() {
        storyLabel.text = story
        storyLabel.font = .preferredFont(forTextStyle: .title2)
        storyLabel.numberOfLines = 0
        
        descriptionLabel.text = "Как тебя зовут?"
        descriptionLabel.font = .preferredFont(forTextStyle: .title1)
        
        nameField.placeholder = "Имя:"
        nameField.borderStyle = .roundedRect
        nameField.font = .preferredFont(forTextStyle: .title3)
        
        warningLabel.text = "Введите имя"
        warningLabel.font = .preferredFont(forTextStyle: .footnote)
        warningLabel.textColor = .red
        warningLabel.isHidden = true
        
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "preview", image: UIImage(systemName: "eyes"), target: self, action: #selector(previewStory))
        
        [storyLabel, descriptionLabel, nameField, warningLabel, continueButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            storyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            nameField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            warningLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 8),
            warningLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            
            continueButton.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 8),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func previewStory() {
        storyLabel.isHidden.toggle()
    }
    
    @objc private func goToNextScreen() {
        if let name = nameField.text {
            if name != "" {
                let updatedStory = "\(story)\nМеня зовут \(name)"
                navigationController?.pushViewController(AgeVC(story: updatedStory), animated: true)
            } else {
                warningLabel.isHidden = false
            }
        } else {
            warningLabel.isHidden = false
        }
    }
}
