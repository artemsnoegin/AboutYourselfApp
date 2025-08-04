//
//  HobbyVC.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 04.08.2025.
//

import UIKit

class HobbyVC: UIViewController {
    
    var story: String
    
    private let storyLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let hobbyField = UITextField()
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
        title = "Hobby"
        
        setUpUI()
    }
    
    private func setUpUI() {
        storyLabel.text = story
        storyLabel.font = .preferredFont(forTextStyle: .title2)
        storyLabel.numberOfLines = 0
        
        descriptionLabel.text = "Что ты любишь?"
        descriptionLabel.font = .preferredFont(forTextStyle: .title1)
        
        hobbyField.placeholder = "Хобби:"
        hobbyField.borderStyle = .roundedRect
        hobbyField.font = .preferredFont(forTextStyle: .title3)
        hobbyField.autocapitalizationType = .none
        
        warningLabel.text = "Введите хобби"
        warningLabel.font = .preferredFont(forTextStyle: .footnote)
        warningLabel.textColor = .red
        warningLabel.isHidden = true
        
        continueButton.setTitle("Завершить", for: .normal)
        continueButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Preview", image: UIImage(systemName: "eyes"), target: self, action: #selector(previewStory))
        
        [storyLabel, descriptionLabel, hobbyField, warningLabel, continueButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            storyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: hobbyField.topAnchor, constant: -8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            hobbyField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hobbyField.heightAnchor.constraint(equalToConstant: 40),
            hobbyField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hobbyField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            warningLabel.topAnchor.constraint(equalTo: hobbyField.bottomAnchor, constant: 8),
            warningLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            
            continueButton.topAnchor.constraint(equalTo: hobbyField.bottomAnchor, constant: 8),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func previewStory() {
        storyLabel.isHidden.toggle()
    }
    
    @objc private func goToNextScreen() {
        if let hobby = hobbyField.text {
            if hobby != "" {
                let updatedStory = "\(story)\nЯ люблю \(hobby)"
                navigationController?.pushViewController(FinalVC(story: updatedStory), animated: true)
            } else {
                warningLabel.isHidden = false
            }
        } else {
            warningLabel.isHidden = false
        }
    }
}
