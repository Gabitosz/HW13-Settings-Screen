//
//  SettingsView.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 02.11.2023.
//

import UIKit

class SettingsView: UIView {
    
    var enableAirplane = false
    var enableVPN = false
    var tableView: UITableView?
    var sections = SettingsOption.settings
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

     func setupUI() {
        tableView = UITableView()
        guard var tableView = tableView else { return }
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.rowHeight = 44
        tableView.delegate = self
        tableView.dataSource = self
    
         
        addSubview(tableView)

        // Добавьте AutoLayout-констрейнты для таблицы, чтобы она занимала весь экран.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
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
        
        

        // Оставьте код для настройки ячеек (включая Switch) и обработки действий здесь.
        
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

            // Добавьте AutoLayout-констрейнты для badgeNotificationButton здесь.

            badgeNotificationButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                badgeNotificationButton.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor, constant: 270),  // Расположение справа от контента ячейки
                badgeNotificationButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),  // Расположение по центру ячейки
                badgeNotificationButton.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 12),
                badgeNotificationButton.widthAnchor.constraint(equalToConstant: 20),  // Ширина кнопки
                badgeNotificationButton.heightAnchor.constraint(equalToConstant: 20)  // Высота кнопки
            ])

        }

        cell.configure(with: setting)
        return cell
        
        
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

