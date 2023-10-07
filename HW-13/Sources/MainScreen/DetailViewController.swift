//
//  SettingDescriptionViewController.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 05.10.2023.
//

import UIKit

class DetailViewController: UIViewController {

    private var settingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var iconImage: UIImage = {
        let image = UIImage()
        return image
    }()
    
    var dataToPass: SettingsOption?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let data = dataToPass {
            settingLabel.text = "Вы выбрали \(data.title)"
        
        }
        view.addSubview(settingLabel)
        setupLayout()
        

    }
    
    private func setupLayout() {
        settingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    

}
