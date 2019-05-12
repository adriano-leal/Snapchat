//
//  CreateAccountViewController.swift
//  Snapchat
//
//  Created by Adriano Ramos on 11/05/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirmation: UITextField!
    
    @IBAction func signupButton(_ sender: Any) {
        if let email = self.email.text {
            if let password = self.password.text {
                if let passwordConfirmation = self.passwordConfirmation.text {
                    
                    if password == passwordConfirmation {
                        // Create account
                        let authentication = Auth.auth()
                        authentication.createUser(withEmail: email, password: password) { (user, error) in
                            if error == nil {
                                if user == nil {
                                    self.showMessage(title: "Auth Error", content: "Issue while trying to log in. Try again!")
                                } else {
                                    print("User successfully created")
                                    self.performSegue(withIdentifier: "signupSegue", sender: nil)
                                }
                            } else {
                                let erro = error! as NSError
//                                erro.localizedDescription
                                if let codeError = erro.userInfo["error_name"] {
                                    let errorText = codeError as! String
                                    var errorMessage = ""
                                    switch errorText {
                                    case "ERROR_EMAIL_ALREADY_IN_USE":
                                        errorMessage = "Email has already been used."
                                        break
                                    case "ERROR_WEAK_PASSWORD":
                                        errorMessage = "The password must have at least 6 characters"
                                        break
                                    case "ERROR_INVALID_EMAIL":
                                        errorMessage = "Check if your email is correct"
                                        break
                                    default:
                                        errorMessage = "Invalid inputs!"
                                    }
                                    self.showMessage(title: "Invalid data", content: errorMessage)
                                }
                            }
                        }
                    } else {
                        self.showMessage(title: "Incorrect Inputs", content: "The passwords do not match. Try again")
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
