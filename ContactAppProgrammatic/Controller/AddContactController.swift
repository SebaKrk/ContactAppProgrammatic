//
//  AddContactController.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 22/12/2020.
//

import UIKit

class AddContactController : UIViewController {
    
    
    
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
