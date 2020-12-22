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
        setUpTextField(textField, placeHolder: "Name", keyboardType: UIKeyboardType.default)
        return textField
    }()
    
    let userNameTF : UITextField = {
        let textField = UITextField()
        setUpTextField(textField, placeHolder: "User Name", keyboardType: UIKeyboardType.default)
        return textField
    }()
    
    let phoneTF: UITextField = {
        let textField = UITextField()
        setUpTextField(textField, placeHolder: "Phone Nummber", keyboardType: UIKeyboardType.numberPad)
        return textField
    }()
    
    let emailTF : UITextField = {
        let textField = UITextField()
        setUpTextField(textField, placeHolder: "Email Adress", keyboardType: UIKeyboardType.emailAddress)
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
    func setUpTextFieldConstrainst(textField: UITextField) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setUpViewConstraints() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTF)
        nameTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        setUpTextFieldConstrainst(textField: nameTF)
        
        view.addSubview(userNameTF)
        userNameTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor,constant: 10).isActive = true
        setUpTextFieldConstrainst(textField: userNameTF)
        
        view.addSubview(phoneTF)
        phoneTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 10).isActive = true
        setUpTextFieldConstrainst(textField: phoneTF)
        
        view.addSubview(emailTF)
        emailTF.topAnchor.constraint(equalTo: phoneTF.bottomAnchor, constant: 10).isActive = true
        setUpTextFieldConstrainst(textField: emailTF)
        
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
