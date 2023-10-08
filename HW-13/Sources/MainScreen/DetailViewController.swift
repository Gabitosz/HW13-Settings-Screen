//
//  SettingDescriptionViewController.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 05.10.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var dataToPass: SettingsOption?
    
    // MARK: Outlets
    
    private var settingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fetchData()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: Setup
    
    private func setupHierarchy() {
        view.addSubview(settingLabel)
        view.addSubview(iconImage)
    }
    
    private func setupLayout() {
        iconImage.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            settingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 45),
            iconImage.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    private func fetchData() {
        if let data = dataToPass {
            settingLabel.text = "Вы выбрали -> \(data.title)"
            if data.iconIsFromAssets {
                iconImage.image = UIImage(named: data.icon ?? "heart.fill")
            } else {
                iconImage.image = UIImage(systemName: data.icon ?? "heart.fill")
            }
            
            iconImage.backgroundColor = data.iconBackgroundColor.value
        }
    }
}
