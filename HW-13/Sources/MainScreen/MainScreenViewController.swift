//
//  ViewController.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 01.10.2023.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var enableAirplane = false
    var enableVPN = false
    var sections = SettingsOption.settings
    
    // MARK: Outlets
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        table.rowHeight = 44
        return table
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: Setup
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.frame = view.bounds
    }
    
    // MARK: - Actions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = sections[indexPath.section][indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        // Добавление Switch
        
        if setting.title == "Авиарежим" {
            let blockView = UIView(frame: CGRect(x: 0, y: 0 , width: cell.contentView.bounds.width + 2, height: cell.contentView.bounds.height))
            blockView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: true)
            switchView.addTarget(self, action: #selector(toggleAirplane), for: .valueChanged)
            cell.accessoryView = switchView
            tableView.addSubview(blockView)
            blockView.addSubview(switchView)
            
        }  else if setting.title == "VPN" {
            let blockView = UIView(frame: CGRect(x: 0, y: 220 , width: cell.contentView.bounds.width + 2, height: cell.contentView.bounds.height))
            blockView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: true)
            switchView.addTarget(self, action: #selector(toggleVPN), for: .valueChanged)
            cell.accessoryView = switchView
            tableView.addSubview(blockView)
            blockView.addSubview(switchView)
        }   else {
            cell.accessoryView = nil
        }
        
        if let badgeNotification = setting.notificationBadge {
            let badgeNotificationButton = UIButton(type: .system)
            var config = UIButton.Configuration.filled()
            
            config.title = String(badgeNotification)
            config.baseBackgroundColor = .systemRed
            config.buttonSize = .mini
            badgeNotificationButton.configuration = config
            cell.addSubview(badgeNotificationButton)
            
            badgeNotificationButton.translatesAutoresizingMaskIntoConstraints = false
            badgeNotificationButton.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor, constant: 280).isActive = true
            badgeNotificationButton.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
            badgeNotificationButton.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8).isActive = true
        }
        cell.configure(with: setting)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        let section = sections[indexPath.section][indexPath.row]
        
        print("Нажата кнопка -> \(section.title)")
        detailView.dataToPass = section
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    // MARK: Actions
    
    @objc func toggleAirplane(_ sender: UISwitch) {
        self.enableAirplane = sender.isOn
        print(enableAirplane)
    }
    
    @objc func toggleVPN(_ sender: UISwitch) {
        self.enableVPN = sender.isOn
        print(enableVPN)
    }
}

// Section

struct SettingsSection {
    let options: [SettingsOption]
}

