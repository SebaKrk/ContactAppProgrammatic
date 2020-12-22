//
//  AddContactController.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 22/12/2020.
//

import UIKit

class AddContactController : UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Contacts"
        label.font = UIFont(name: "Helvetica-Bold", size: 30)
        return label
    }()
    
    let nameTF: UITextField = {
        let textField = UITextField()
        setUpTextField(textField, placeHolder: "name", keyboardType: UIKeyboardType.default)
        return textField
    }()
    
    let phoneTF: UITextField = {
        let textField = UITextField()
        setUpTextField(textField, placeHolder: "phone nummber", keyboardType: UIKeyboardType.numberPad)
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        setUpBarButton()
        setUpViewConstraints()
        
    }
    //    MARK: - SetUpBarButton
    
    func setUpBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleRightBarButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleLeftbarButton))
    }
    
    //    MARK: - OBJC Func
    
    @objc func handleRightBarButton(){
        print("done")
    }
    @objc func handleLeftbarButton(){
        print("cancle")
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - SetUpViewConstraints
    
    func setUpViewConstraints() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTF)
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        nameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        nameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
        nameTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(phoneTF)
        phoneTF.translatesAutoresizingMaskIntoConstraints = false
        phoneTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor,constant: 10).isActive = true
        phoneTF.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        phoneTF.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
        phoneTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
}


// MARK: - HelperFuncions

func setUpTextField(_ textField: UITextField, placeHolder: String, keyboardType: UIKeyboardType) {
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeHolder
    textField.keyboardType = keyboardType
    textField.returnKeyType = UIReturnKeyType.done
    textField.autocorrectionType = UITextAutocorrectionType.no
    textField.font = UIFont.systemFont(ofSize: 20)
    textField.textColor = UIColor.label
    textField.tintColor = UIColor.secondaryLabel
    
    textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes:[NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel])
    
    textField.borderStyle = UITextField.BorderStyle.roundedRect
    textField.layer.borderColor = UIColor.secondaryLabel.cgColor
    textField.layer.borderWidth = 0.5
    textField.layer.cornerRadius = 5
    textField.clearButtonMode = UITextField.ViewMode.whileEditing
    textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    
}
