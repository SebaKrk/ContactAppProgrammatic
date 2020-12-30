//
//  AddContactController.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 22/12/2020.
//

import UIKit

protocol AddContactDelegate {  // protocol
    func addContact(contact: Contact)
}

class AddContactController : UIViewController {
    
    var delegate: AddContactDelegate?  // protocol
    
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
    
    var sexLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    var sexImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "man"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    var sexSegmentControll : UISegmentedControl = {
        let sex = ["♀","♂︎"]
        let segment = UISegmentedControl(items: sex)
        segment.addTarget(self, action: #selector(handleSegmentControl(_:) ), for: .valueChanged)
        return segment
    }()
    
    @objc func handleSegmentControl(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            sexLabel.text = " ♀ women"
            
        case 1:
            sexLabel.text = " ♂︎ man"
            
        default:
            return
        }
    }
    
    let country = ["AT","BE","BG","HR","CY","CZ","DK","EE","FI","FR","GR","ES","IE","LT","LU","LV","MT","NL","DE","PL","PT","RO","SK","SI","SE","HU","GB","IT"]
    
    var countryPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    var countryLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    //    MARK: - VieDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        setUpBarButton()
        setUpViewConstraints()
        countryPicker.delegate = self
        countryPicker.dataSource = self
    }
    //    MARK: - SetUpBarButton
    
    func setUpBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleRightBarButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleLeftbarButton))
    }
    
    //    MARK: - OBJC Func
    
    enum SubmiError:Error {
        case fieldsCannotBeNull
    }
    
    @objc func handleRightBarButton()
    {
        
        do {
            guard let name = nameTF.text,nameTF.hasText,
                  let lastName = userNameTF.text,userNameTF.hasText,
                  let phone = phoneTF.text,phoneTF.hasText,
                  let emial = emailTF.text, emailTF.hasText,
                  let sex = sexLabel.text,
                  let country = countryLabel.text
            
            
            else {
                throw SubmiError.fieldsCannotBeNull
            }
            
            let contact = Contact(name: name, userName: lastName, phone: phone, email: emial, sex: sex, country: country)
            delegate?.addContact(contact: contact)
            dismiss(animated: true)
            print(contact)
            
        } catch {
            let alertController = UIAlertController(title: "Error", message: "Please fill the details correctly", preferredStyle: .alert) // or .actionSheet
            
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    @objc func handleLeftbarButton(){
        print("cancel")
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - SetUpViewConstraints
    
    func setUpTextFieldConstrainst(textField: UITextField) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
        
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
        
        view.addSubview(sexSegmentControll)
        sexSegmentControll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sexSegmentControll.topAnchor.constraint(equalTo: emailTF.bottomAnchor,constant: 10),
            sexSegmentControll.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            sexSegmentControll.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40)
        ])
        
        view.addSubview(countryPicker)
        countryPicker.translatesAutoresizingMaskIntoConstraints = false
        countryPicker.topAnchor.constraint(equalTo: sexSegmentControll.bottomAnchor,constant: 10).isActive = true
        countryPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        countryPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        countryPicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
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

// MARK: - PickerVIew

extension AddContactController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return country.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        countryLabel.text = country[row]
        
    }
    
    
}

