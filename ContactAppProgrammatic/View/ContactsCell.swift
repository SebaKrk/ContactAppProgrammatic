//
//  ContactsCell.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 22/12/2020.
//

import UIKit

class ContactsCell: UITableViewCell {
    
    let contactImage : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        return image
    }()
    
    let sexLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let lastNameLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let phoneLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let emialLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let countryImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




