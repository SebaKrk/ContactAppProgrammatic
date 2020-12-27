//
//  ContactsCell.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 22/12/2020.
//

import UIKit

class ContactsCell: UITableViewCell {
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// stworzyyc wyglad pokazywanego konataktu w tableView
// ma wyswietlc od lewej obraz koboety / mezczyzny
// imie naziwsko
// adres mailowy
// numer telefonu
// po prawej wybrany kraj / narodowosc

