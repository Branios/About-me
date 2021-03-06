//
//  WelcomePageViewController.swift
//  About me
//
//  Created by VK on 24.05.2022.
//

import UIKit

class WelcomePageViewController: UIViewController {
    
    @IBOutlet var welcomeTextField: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeTextField.text = "Welcome \(user.person.fullname)"
    }
    @IBAction func signOutButton() {
        dismiss(animated: true)
    }
    
}
