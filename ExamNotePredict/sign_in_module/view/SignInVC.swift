//
//  SignInVC.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 17.04.2022.
//

import Foundation
import UIKit

class SignInVC:UIViewController{
    
    var presenter:ViewToPresenterSignInProtocol?
    var type:SignInType = SignInType.SignIn
    
    @IBOutlet weak var createNewAccountButton: UIButton!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        SignInRouter.createModule(ref: self)
        signInButton.reshapeButton()
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        if type == SignInType.SignIn{
            type = SignInType.SignUp
            pageTitle.text = "Sign Up"
            signInButton.titleLabel?.text = "Sign Up"
            createNewAccountButton.titleLabel?.text = "You have already had an account"
        }else{
            type = SignInType.SignIn
            pageTitle.text = "Sign In"
            signInButton.titleLabel?.text = "Sign In"
            createNewAccountButton.titleLabel?.text = "Create New Account"
        }
    }
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let signInModel = SignInData(email: emailTextField.text!, password: passwordTextField.text!)
        if type == SignInType.SignIn{
            presenter?.signIn(signInModel: signInModel)
        }else{
            presenter?.signUp(signUpModel: signInModel)
        }
    }
}

extension SignInVC:PresenterToViewSignInProtocol{
    func getResult(signInResult: Bool) {
        var message = "Succesful"
        Session.loggedIn = true
        if !signInResult{
            Session.loggedIn = false
            message = "Not" + message
        }
        let alert = UIAlertController(title: "User Operation", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            if signInResult{
                self.navigationController?.popViewController(animated: true)
            }
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
