//
//  Colors.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 08.10.2023.
//
import UIKit

enum MyColor {
    case orange
    case blue
    case green
    case red
    case purple
    case gray
}

extension MyColor {
    var value: UIColor {
        get {
            switch self {
            case .orange:
                return UIColor(red: 240 / 255, green: 154 / 255, blue: 54 / 255, alpha: 1.0)
            case .blue:
                return UIColor(red: 52 / 255, green: 120 / 255, blue: 246 / 255, alpha: 1.0)
            case .green:
                return UIColor(red: 101 / 255, green: 196 / 255, blue: 102 / 255, alpha: 1.0)
            case .red:
                return UIColor(red: 235 / 255, green: 77 / 255, blue: 60 / 255, alpha: 1.0)
            case .purple:
                return UIColor(red: 87 / 255, green: 86 / 255, blue: 206 / 255, alpha: 1.0)
            case .gray:
                return UIColor(red: 142 / 255, green: 142 / 255, blue: 146 / 255, alpha: 1.0)
            }
            
        }
    }
}
