//
//  LoginViewController.swift
//  Snapchat
//
//  Created by Adriano Ramos on 11/05/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    // Autenticas Usuario no FireBase
    @IBAction func loginButton(_ sender: Any) {
        if let email = self.email.text {
            if let password = self.password.text {
                let authentication = Auth.auth()
                authentication.signIn(withEmail: email, password: password) { (user, error) in
                    if error == nil {
                        if user == nil {
                            self.showMessage(title: "Auth Error", content: "Issue while trying to log in. Try again!")
                        } else {
                            // Redirect user to main screen
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        }
                        
                    } else {
                        self.showMessage(title: "Invalid input", content: "Check your email or password")
                    }
                }
            }
        }
    }
    
    func showMessage(title: String, content: String) {
        let alert = UIAlertController(title: title, message: content, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
