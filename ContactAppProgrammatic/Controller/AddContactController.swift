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
    
    lazy var contactImg : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "DefaultProfileImage").withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    lazy var contactButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 75
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleImageButton), for: .touchUpInside)
        return button
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
    
    var sexSegmentControll : UISegmentedControl = {
        let sex = ["♀","♂︎"]
        let segment = UISegmentedControl(items: sex)
        segment.addTarget(self, action: #selector(handleSegmentControl(_:) ), for: .valueChanged)
        return segment
    }()
    //    MARK: - OBJC Func
    
    @objc func handleImageButton() {
        print("image")
        showChoseSourceAlertController()
        
    }
    
    @objc func handleSegmentControl(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            sexLabel.text = "♀ women "
        case 1:
            sexLabel.text = " ♂︎ man "
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
                  let phone = Int(phoneTF.text ?? ""),phoneTF.hasText,
                  let emial = emailTF.text, emailTF.hasText,
                  let sex = sexLabel.text,
                  let country = countryLabel.text,
                  let image = contactImg.image
            
            
            else {
                throw SubmiError.fieldsCannotBeNull
            }
            
            let newContact = Contact(context: DBManger.share.context)
            newContact.name = name
            newContact.userName = lastName
            newContact.phone = String(phone)
            newContact.email = emial
            newContact.sex = sex
            newContact.country = country
            newContact.contactImg = image.pngData()
            
            DBManger.share.saveContext()
            
            dismiss(animated: true)
            print(newContact)
            
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
        
        view.addSubview(contactImg)
        contactImg.translatesAutoresizingMaskIntoConstraints = false
        contactImg.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        contactImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contactImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        contactImg.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(contactButton)
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.centerXAnchor.constraint(equalTo: contactImg.centerXAnchor).isActive = true
        contactButton.centerYAnchor.constraint(equalTo: contactImg.centerYAnchor).isActive = true
        contactButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        contactButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(nameTF)
        nameTF.topAnchor.constraint(equalTo: contactImg.bottomAnchor, constant: 10).isActive = true
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

// MARK: - ImagePicker

extension AddContactController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showChoseSourceAlertController() {
        let photoLibraryAction = UIAlertAction(title: "chose photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "take new photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancleAction = UIAlertAction(title: "cancle", style: .cancel, handler: nil)
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(photoLibraryAction)
        sheet.addAction(cameraAction)
        sheet.addAction(cancleAction)
        
        present(sheet, animated: true, completion: nil)
    }
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editingImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            contactImg.image = editingImage
        } else if let orignialImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            contactImg.image = orignialImage
        }
        dismiss(animated: true, completion: nil)
    }
    
}

