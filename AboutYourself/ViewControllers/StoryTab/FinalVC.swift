//
//  FinalVC.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 04.08.2025.
//

import UIKit

class FinalVC: UIViewController {
    
    let story: String
    
    private let storyLabel = UILabel()
    
    
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
        title = "About Yourself"
        
        setUpUI()
    }
    
    private func setUpUI() {
        storyLabel.text = story
        storyLabel.font = .preferredFont(forTextStyle: .title1)
        storyLabel.numberOfLines = 0
        
        view.addSubview(storyLabel)
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let rightBarButton = UIBarButtonItem(title: "Restart", image: nil, target: self, action: #selector(startAgain))
        navigationItem.rightBarButtonItem = rightBarButton
        rightBarButton.tintColor = .red

        NSLayoutConstraint.activate([
            storyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func startAgain() {
        navigationController?.popToRootViewController(animated: true)
    }
}
