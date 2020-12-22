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
    
    //    MARK: - BarButtonItem
    
    func setUpBarbuttonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(hanldeAddButton))
    }
    @objc func hanldeAddButton() {
        print("add")
    }
    
    //    MARK: - RegisterTableView
    
    func registerTableView() {
        tableView.register(ContactsCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    //    MARK: - TableView

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
}
