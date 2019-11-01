//
//  SignUpController.swift
//  HiWorld
//
//  Created by Thao Vu on 09/20/19.
//  Copyright © 2019 Thao Vu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class SignUpController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var cancelLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
        
     
    }
    
    func setUpElements() {
        
        //Hide cancel label
        cancelLabel.alpha = 0;
        
        //Style the elements
        Utilities.styleTextField(textField: firstNameTextField)
        Utilities.styleTextField(textField: lastNameTextField)
        Utilities.styleTextField(textField: emailTextField)
        Utilities.styleTextField(textField: passwordTextField)

        Utilities.styleFilledButton(button: signUpButton)
        
        
    }
    
    func validateFields() -> String? {
        
        //check fields are filled
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Fill in all fields."
            
        }
        //check if password is secured
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password is not strong enough
            return "Check if your password is at least 8 characters, contains a special character and a number"
           
        }
        return nil
        
    }

    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            //error detected
            showError(message: error!)
        }
        
        else{
            //create cleaned version of data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError(message: "Error Creating User")
                }
                else {
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]) {(error) in
                        
                        
                        if error != nil {
                            self.showError(message: "Error saving data's first name and last name")
                            
                            
                        }
                    }
                    
                    self.transitionToHome()
                }
            }
            
        }
    }
    
    func showError( message : String){
        cancelLabel.text = message
        cancelLabel.alpha = 1
    }
    
    func transitionToHome(){
        let homeViewController =  storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
