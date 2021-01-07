//
//  ContactsController.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 22/12/2020.
//

import UIKit

class ContactsController: UITableViewController {
    
    private let reuseIdentifier = "cell"
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBarbuttonItem()
        registerTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contacts = DBManger.share.fetchContact()
        tableView.reloadData()
    }
    
    //    MARK: - BarButtonItem
    
    func setUpBarbuttonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(hanldeAddButton))
    }
    @objc func hanldeAddButton() {
        
        let controller = AddContactController()
        let rootVC = controller
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
        
    }
    
    //    MARK: - RegisterTableView
    
    func registerTableView() {
        tableView.register(ContactsCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 120
    }
    
    //    MARK: - TableView
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ContactsCell
        
        let contact = contacts[indexPath.row]
        cell.set(res: contact)
        
        if let imageData = contact.contactImg, let countryImgData = contact.countryImg {
            cell.contactImage.image = UIImage(data: imageData)
            cell.countryImage.image = UIImage(data: countryImgData)
        } else {
            cell.contactImage.image = #imageLiteral(resourceName: "person")
            cell.countryImage.image = #imageLiteral(resourceName: "non")
        }
        return cell
    }
    
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                DBManger.share.context.delete(contacts[indexPath.row])
                DBManger.share.saveContext()
                contacts.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        
    private func edit(rowIndexPath indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "edit") { (_, _, _) in
            
            let alert = UIAlertController(title: "Warning", message: "Do You want to Edit", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes - maybe later", style: .default)
            let noAction = UIAlertAction(title: "No - thank you", style: .default)
            noAction.setValue(UIColor.red, forKey: "titleTextColor")
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        return action
    }
    
    private func mail(rowIndexpath indexPath: IndexPath) -> UIContextualAction {

        let action =  UIContextualAction(style: .normal, title: "mail") { (_, _, _) in
            print("send mail to: \(String(self.contacts[indexPath.row].email!)) ")
        }
        
        return action
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = self.edit(rowIndexPath: indexPath)
        edit.backgroundColor = .systemYellow
        let mail = self.mail(rowIndexpath: indexPath)
        mail.backgroundColor = .systemBlue
        let swipe = UISwipeActionsConfiguration(actions: [edit,mail])
        
        return swipe
        
    }
}
