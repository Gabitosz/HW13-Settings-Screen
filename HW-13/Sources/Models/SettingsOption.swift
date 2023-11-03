//
//  SettingsOption.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 08.10.2023.
//

import Foundation

struct SettingsOption {
    let title: String
    let icon: String?
    var detail: String?
    var notificationBadge: Int?
    let iconBackgroundColor: MyColor
    let iconIsFromAssets: Bool
}

extension SettingsOption {
    static var settings: [[SettingsOption]] {
        [[SettingsOption(title: "Авиарежим",
                         icon: "airplane",
                         iconBackgroundColor: MyColor.orange,
                         iconIsFromAssets: false),
          SettingsOption(title: "Wi-Fi",
                         icon: "wifi",
                         detail: "Не подключено",
                         iconBackgroundColor: MyColor.blue,
                         iconIsFromAssets:  false),
          SettingsOption(title: "Bluetooth",
                         icon: "bluetooth",
                         detail: "Вкл.",
                         iconBackgroundColor: MyColor.blue,
                         iconIsFromAssets: true),
          SettingsOption(title: "Сотовая связь",
                         icon: "antenna.radiowaves.left.and.right",
                         iconBackgroundColor: MyColor.green,
                         iconIsFromAssets: false),
          SettingsOption(title: "Режим модема",
                         icon: "personalhotspot",
                         iconBackgroundColor: MyColor.green,
                         iconIsFromAssets: false),
          SettingsOption(title: "VPN",
                         icon: "vpn",
                         iconBackgroundColor: MyColor.blue,
                         iconIsFromAssets: true)],
         //         секция 2
         [SettingsOption(title: "Уведомления", icon: "notification", iconBackgroundColor: MyColor.red, iconIsFromAssets: true),
          SettingsOption(title: "Звуки, тактильные сигналы", icon: "speaker.wave.3.fill", iconBackgroundColor: MyColor.red, iconIsFromAssets: false),
          SettingsOption(title: "Не беспокоить", icon: "moon.fill", iconBackgroundColor: MyColor.purple, iconIsFromAssets: false),
          SettingsOption(title: "Экранное время", icon: "hourglass", iconBackgroundColor: MyColor.purple, iconIsFromAssets: false)],
         //      секция 3
         [SettingsOption(title: "Основные", icon: "settings", notificationBadge: 1, iconBackgroundColor: MyColor.gray, iconIsFromAssets: true),
          SettingsOption(title: "Пункт управления", icon: "switch.2", iconBackgroundColor: MyColor.gray, iconIsFromAssets: false),
          SettingsOption(title: "Экран и яркость", icon: "textformat.size", iconBackgroundColor: MyColor.blue, iconIsFromAssets: false),
          SettingsOption(title: "Экран «Домой»", icon: "home", iconBackgroundColor: MyColor.blue, iconIsFromAssets: true),
          SettingsOption(title: "Универсальный доступ", icon: "universalAccess", iconBackgroundColor: MyColor.blue, iconIsFromAssets: true)]]
    }
}

struct SettingsSection {
    let options: [SettingsOption]
}
