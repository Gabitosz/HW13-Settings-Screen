//
//  ViewController.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 01.10.2023.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate {
   
    
    var sections = [SettingsSection]()
    // Добавьте свойство для SettingsView
    private let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавьте SettingsView как подвид внутри MainScreenViewController
        view.addSubview(settingsView)
        
        // Вызовите метод настройки SettingsView
        settingsView.setupUI()
       
        setupUI()
        view = settingsView
        settingsView.tableView?.delegate = self
        
        //Looks for single or multiple taps.
//             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//
//            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
//            //tap.cancelsTouchesInView = false
//
//            view.addGestureRecognizer(tap)
        
        
       
        print(settingsView.tableView?.delegate)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            // Проверяем, что таблица загружена
            if let tableView = settingsView.tableView {
                // Устанавливаем контроллер как делегата
                print("here")
                tableView.delegate = self
                tableView.reloadData() // Можно вызвать reloadData() после установки делегата
            }
    }

    // Остальной код MainScreenViewController...
    
    private func setupUI() {
        // Настройки для MainScreenViewController
       
        view.backgroundColor = .systemBackground
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
       
    }
 
    
}

extension MainScreenViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("hre")
        let detailView = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        print(tableView)
        let section = sections[indexPath.section].options[indexPath.row]
        
        print("Нажата кнопка -> \(section.title)")
        detailView.dataToPass = section
        navigationController?.pushViewController(detailView, animated: true)

    }
}




