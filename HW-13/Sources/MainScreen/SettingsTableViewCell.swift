//
//  SettingsTableViewCell.swift
//  HW-13
//
//  Created by Gabriel Zdravkovici on 03.10.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
        
    }()
    
    private let accessoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let views = [label, iconContainer, accessoryLabel]
        iconContainer.addSubview(iconImageView)
        views.forEach { contentView.addSubview($0) }
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 10, y: 5, width: size, height: size)
        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(x: (size-imageSize) / 2, y: (size-imageSize) / 2, width: imageSize, height: imageSize)
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width, y: 0, width: contentView.frame.width - 25 - iconContainer.frame.size.width, height: contentView.frame.size.height)
        accessoryLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        accessoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        accessoryLabel.text = nil
    }
    
    public func configure(with setting: SettingsOption) {
        label.text = setting.title
        iconImageView.image = setting.icon
        iconContainer.backgroundColor = setting.iconBackgroundColor
        accessoryLabel.text = setting.detail
        
    }
}
