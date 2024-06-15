//
//  LoginViewController.swift
//  Personal ChatApp
//
//  Created by Aakanksha on 14/06/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.decorateView()
    }
    
    func decorateView() {
        self.mainView.layer.cornerRadius = 30.0
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if user != nil {
                print("User created successfully")
                let loginVc = LoginViewController()
                self.navigationController?.pushViewController(loginVc, animated: true)
            } else {
                print(error!)
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let loginVc = LoginViewController()
        self.navigationController?.pushViewController(loginVc, animated: true)
    }
}


