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
}
