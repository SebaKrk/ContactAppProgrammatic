//
//  ContactsCell.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 22/12/2020.
//

import UIKit

class ContactsCell: UITableViewCell {
    
    let backgroundCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor.secondarySystemBackground
        view.clipsToBounds = true
        return view
    }()
    
    let contactImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let sexLabel : UILabel = {
        let label = UILabel()
        label.text = "Woman"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let lastNameLabel : UILabel = {
        let label = UILabel()
        label.text = "LastNamew"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let phoneLabel : UILabel = {
        let label = UILabel()
        label.text = "999-333-222"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let emialLabel : UILabel = {
        let label = UILabel()
        label.text = "name@email.com"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let countryImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "pl"))
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    let countrylLabel : UILabel = {
        let label = UILabel()
        label.text = "PL"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    //    MARK: INIT
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(res : Contact) {
        nameLabel.text = res.name
        lastNameLabel.text = res.userName
        phoneLabel.text = String(res.phone!)
        emialLabel.text = res.email
        sexLabel.text = res.sex
        countrylLabel.text = res.country
//        contactImage.image = res.sexImageM
    }
    
    //    MARK: - SetUpConstraints
    
    func setUpConstraints() {
        addSubview(backgroundCard)
        backgroundCard.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        backgroundCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        backgroundCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        backgroundCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        addSubview(contactImage)
        contactImage.centerYAnchor.constraint(equalTo: backgroundCard.centerYAnchor).isActive = true
        contactImage.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 5).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 76).isActive = true
        contactImage.heightAnchor.constraint(equalToConstant: 76).isActive = true
        
        addSubview(sexLabel)
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.topAnchor.constraint(equalTo: contactImage.bottomAnchor,constant: 1).isActive = true
        sexLabel.centerXAnchor.constraint(equalTo: contactImage.centerXAnchor).isActive = true
        sexLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        addSubview(containerView)
        containerView.centerYAnchor.constraint(equalTo: backgroundCard.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 5).isActive = true
        containerView.trailingAnchor.constraint(equalTo: backgroundCard.trailingAnchor,constant: -5).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 1).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -1).isActive = true
        
        containerView.addSubview(lastNameLabel)
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 1).isActive = true
        lastNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 1).isActive = true
        lastNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -1).isActive = true
        
        containerView.addSubview(phoneLabel)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor,constant: 1).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 1).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -1).isActive = true
        
        containerView.addSubview(emialLabel)
        emialLabel.translatesAutoresizingMaskIntoConstraints = false
        emialLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 1).isActive = true
        emialLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 1).isActive = true
        emialLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -1).isActive = true
        
        addSubview(countryImage)
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.centerYAnchor.constraint(equalTo: backgroundCard.centerYAnchor).isActive = true
        countryImage.trailingAnchor.constraint(equalTo: backgroundCard.trailingAnchor, constant: -5).isActive = true
        countryImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        countryImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(countrylLabel)
        countrylLabel.translatesAutoresizingMaskIntoConstraints = false
        countrylLabel.topAnchor.constraint(equalTo: countryImage.bottomAnchor,constant: 5).isActive = true
        countrylLabel.centerXAnchor.constraint(equalTo: countryImage.centerXAnchor).isActive = true
    }
    
}



