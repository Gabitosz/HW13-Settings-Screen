//
//  ViewController.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 01.10.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    var sections = [SettingsSection]()
    private let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        settingsView.setupHierarchy()
        setupView()
        setupDelegates()
    }
    
    private func setupView() {
        view = settingsView
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(settingsView)
    }
    
    private func setupDelegates() {
        settingsView.delegate = self
    }
}

extension MainScreenViewController: SettingsViewDelegate {
    func selectedCell(setting: SettingsOption) {
        let detailView = DetailViewController()
        print("Нажата кнопка -> \(setting.title)")
        detailView.dataToPass = setting
        navigationController?.pushViewController(detailView, animated: true)
    }
}

extension MainScreenViewController: UITableViewDelegate {
    
}




