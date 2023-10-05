//
//  ViewController.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 01.10.2023.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: Outlets
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return table
    }()
    
    var models = [SettingsOption]()
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        setupHierarchy()
        setupLayout()
        configure()
        
       
    }
    
    func configure() {
        self.models = Array(0...100).compactMap({
            SettingsOption(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .purple) {
                
            }
        })
        
    }

    // MARK: Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.frame = view.bounds
        
    }
    
    // MARK: - Actions
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: model)
        return cell
    }
}

