//
//  AboutUsVC.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 04.08.2025.
//

import UIKit

class AboutUsVC: UIViewController {
    
    let aboutLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "About Us"
        
        setUpUI()
    }
    
    private func setUpUI() {
        aboutLabel.text = """
        Снова просят рассказать о себе?
        Не знаешь с чего начать?
        Мы поможем решить эту насущную проблему!
        Начни короткий рассказ о себе
        или подготовь визитку заранее
        с нашим новым приложением
        About Yourself!
        """
        aboutLabel.numberOfLines = 0
        aboutLabel.font = .boldSystemFont(ofSize: 24)
        
        view.addSubview(aboutLabel)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        
        aboutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
