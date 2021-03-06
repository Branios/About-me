//
//  ViewController.swift
//  About me
//
//  Created by VK on 24.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    // MARK: Calling the model instance
    
    private var user = User.getUsers()
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
    
        // MARK: iterating through the viewControllers array
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomePageViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as? AboutMeViewController
                aboutUserVC?.user = user
                let myHobbyVC = navigationVC.topViewController as? MyHobbyViewController
                myHobbyVC?.user = user
            }
        }
    }

    
    // MARK: - Buttons
    

    @IBAction func logInButton(_ sender: Any) {
        if usernameTextField.text != user.login || passwordTextField.text != user.password {
            showAlert(title: "Oops!", message: "Invalid username or password")
        }
    }
    
    @IBAction func forgotButtons(_ sender: UIButton) {
        if sender.tag == 1 {
            showAlert(title: "Hey!", message: "Your login is \(user.login)")
        } else {
            showAlert(title: "Hey!", message: "Your password is \(user.password)")
        }
    }
    

    
    // MARK: - Alert
    
    private func showAlert (title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    
}

