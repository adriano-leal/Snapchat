//
//  ViewController.swift
//  Snapchat
//
//  Created by Adriano Ramos on 11/05/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authentication = Auth.auth()
        
//        do {
//            try authentication.signOut()
//        } catch {
//            print("Error while logging out!")
//        }
//        authentication.addStateDidChangeListener { (authentication, user) in
//            if let userLoggedIn = user {
//                self.performSegue(withIdentifier: "loggedInUser ", sender: nil)
//            }
//        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }


}

