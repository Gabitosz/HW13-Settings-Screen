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
    
    // MARK: Outlets
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return table
    }()
    
    var sections = [SettingsSection]()
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
        
        sections.append(SettingsSection(options: [
            SettingsOption(title: "Авиарежим", icon: UIImage(named: "airplane"), iconBackgroundColor: UIColor(red: 240 / 255, green: 154 / 255, blue: 54 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Wi-Fi", icon: UIImage(named: "wifi"), iconBackgroundColor: UIColor(red: 52 / 255, green: 120 / 255, blue: 246 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconBackgroundColor: UIColor(red: 52 / 255, green: 120 / 255, blue: 246 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Сотовая связь", icon: UIImage(named: "cellular"), iconBackgroundColor: UIColor(red: 101 / 255, green: 196 / 255, blue: 102 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Режим модема", icon: UIImage(named: "modem"), iconBackgroundColor: UIColor(red: 101 / 255, green: 196 / 255, blue: 102 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "VPN", icon: UIImage(named: "vpn"), iconBackgroundColor: UIColor(red: 52 / 255, green: 120 / 255, blue: 246 / 255, alpha: 1)){
                
            }
        ]))
        
        sections.append(SettingsSection(options: [
            SettingsOption(title: "Уведомления", icon: UIImage(named: "notification"), iconBackgroundColor: UIColor(red: 235 / 255, green: 77 / 255, blue: 60 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(named: "sound"), iconBackgroundColor: UIColor(red: 234 / 255, green: 67 / 255, blue: 90 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Не беспокоить", icon: UIImage(named: "moon"), iconBackgroundColor: UIColor(red: 87 / 255, green: 86 / 255, blue: 206 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Экранное время", icon: UIImage(named: "hourglass"), iconBackgroundColor: UIColor(red: 87 / 255, green: 86 / 255, blue: 206 / 255, alpha: 1)){
                
            }
        ]))
        
        sections.append(SettingsSection(options: [
            SettingsOption(title: "Основные", icon: UIImage(named: "settings"), iconBackgroundColor: UIColor(red: 142 / 255, green: 142 / 255, blue: 146 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Пункт управления", icon: UIImage(named: "switch"), iconBackgroundColor: UIColor(red: 142 / 255, green: 142 / 255, blue: 146 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Экран и яркость", icon: UIImage(named: "screenAndBright"), iconBackgroundColor: UIColor(red: 52 / 255, green: 120 / 255, blue: 246 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Экран «Домой»", icon: UIImage(named: "home"), iconBackgroundColor: UIColor(red: 52 / 255, green: 120 / 255, blue: 246 / 255, alpha: 1)){
                
            },
            
            SettingsOption(title: "Универсальный доступ", icon: UIImage(named: "universalAccess"), iconBackgroundColor: UIColor(red: 52 / 255, green: 120 / 255, blue: 246 / 255, alpha: 1)){
                
            },
            
        ]))
    }
    
    // MARK: Setup
    
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
        return sections[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = sections[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        if setting.title == "Авиарежим" {
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: true)
            switchView.addTarget(self, action: #selector(toggleAirplane), for: .valueChanged)
            cell.accessoryView = switchView
        }  else if setting.title == "VPN" {
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: true)
            switchView.addTarget(self, action: #selector(toggleVPN), for: .valueChanged)
            cell.accessoryView = switchView
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
            badgeNotificationButton.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor, constant: 310).isActive = true
            badgeNotificationButton.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
            badgeNotificationButton.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8).isActive = true
        }
        
        cell.configure(with: setting)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = sections[indexPath.section].options[indexPath.row]
        print("Нажата кнопка -> \(section.title)")
        section.handler()
    }
    
    
    @objc func toggleAirplane(_ sender: UISwitch) {
        self.enableAirplane = sender.isOn
        print(enableAirplane)
    }
    
    @objc func toggleVPN(_ sender: UISwitch) {
        self.enableVPN = sender.isOn
        print(enableVPN)
    } 
}

// Setting

struct SettingsOption {
    let title: String
    let icon: UIImage?
    var detail: String?
    var notificationBadge: Int?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

// Section

struct SettingsSection {
    let options: [SettingsOption]
}

