//
//  LoginViewController.swift
//  Personal ChatApp
//
//  Created by Aakanksha on 14/06/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func decorateView() {
        mainView.layer.cornerRadius = 30.0
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if user != nil {
                print("user is logged in")
                let chatVc = ChatViewController()
                self.navigationController?.pushViewController(chatVc, animated: true)
                
            } else if error != nil {
                print("Error is:", error!)
            }
        }
       
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let signUpVc = SignUpViewController()
        self.navigationController?.pushViewController(signUpVc, animated: true)
    }
}
