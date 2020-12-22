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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        setUpBarButton()
        
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
