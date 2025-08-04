//
//  EditCardVC.swift
//  AboutYourself
//
//  Created by Артём Сноегин on 04.08.2025.
//

import UIKit

class EditCardVC: UIViewController {
    
    private let descriptionLabel = UILabel()
    
    private let nameField = UITextField()
    private let nameWarningLabel = UILabel()
    
    private let ageField = UITextField()
    private let ageWarningLabel = UILabel()
    
    private let locationField = UITextField()
    private let locationWarningLabel = UILabel()
    
    private let hobbyField = UITextField()
    private let hobbyWarningLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Edit"
        
        setUpUI()
    }
    
    private func setUpUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", image: nil, target: self, action: #selector(saveCard))
        
        descriptionLabel.text = "Редактор визитки"
        descriptionLabel.font = .preferredFont(forTextStyle: .title1)
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        nameField.placeholder = "Имя:"
        ageField.placeholder = "Возраст:"
        ageField.keyboardType = .numberPad
        locationField.placeholder = "Город:"
        locationField.autocapitalizationType = .words
        hobbyField.placeholder = "Хобби:"
        hobbyField.autocapitalizationType = .none
        [nameField, ageField, locationField, hobbyField].forEach {
            $0.borderStyle = .roundedRect
            $0.font = .preferredFont(forTextStyle: .title3)
            
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        }
        
        nameWarningLabel.text = "Введите имя"
        ageWarningLabel.text = "Введите возраст: от 1 года"
        locationWarningLabel.text = "Введите город"
        hobbyWarningLabel.text = "Введите хобби"
        [nameWarningLabel, ageWarningLabel, locationWarningLabel, hobbyWarningLabel].forEach {
            $0.font = .preferredFont(forTextStyle: .footnote)
            $0.textColor = .red
            $0.isHidden = true
            
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        }
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            nameField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            nameWarningLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 4),
            
            ageField.topAnchor.constraint(equalTo: nameWarningLabel.bottomAnchor, constant: 8),
            ageWarningLabel.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 4),
            
            locationField.topAnchor.constraint(equalTo: ageWarningLabel.bottomAnchor, constant: 8),
            locationWarningLabel.topAnchor.constraint(equalTo: locationField.bottomAnchor, constant: 4),
            
            hobbyField.topAnchor.constraint(equalTo: locationWarningLabel.bottomAnchor, constant: 8),
            hobbyWarningLabel.topAnchor.constraint(equalTo: hobbyField.bottomAnchor, constant: 4),
        ])
    }

    @objc private func saveCard() {
        let newCard = Card()
        
        if let unwrappedName = nameField.text {
            if unwrappedName != "" {
                newCard.name = unwrappedName
                nameWarningLabel.isHidden = true
            } else {
                nameWarningLabel.isHidden = false
            }
        } else {
            nameWarningLabel.isHidden = false
        }
        
        if let unwrappedAge = Int(ageField.text ?? "") {
            if unwrappedAge >= 1 {
                newCard.age = unwrappedAge
                ageWarningLabel.isHidden = true
            } else {
                ageWarningLabel.isHidden = false
            }
        } else {
            ageWarningLabel.isHidden = false
        }
        
        if let unwrappedLocation = locationField.text {
            if unwrappedLocation != "" {
                newCard.location = unwrappedLocation
                locationWarningLabel.isHidden = true
            } else {
                locationWarningLabel.isHidden = false
            }
        } else {
            locationWarningLabel.isHidden = false
        }
        
        if let unwrappedHobby = hobbyField.text {
            if unwrappedHobby != "" {
                newCard.hobby = unwrappedHobby
                hobbyWarningLabel.isHidden = true
            } else {
                hobbyWarningLabel.isHidden = false
            }
        } else {
            hobbyWarningLabel.isHidden = false
        }
        
        if newCard.containsNil() == false {
            navigationController?.pushViewController(UserCardVC(userCard: newCard), animated: true)
        }
    }
}

