//
//  LoginController.swift
//  HiWorld
//
//  Created by Thao Vu on 09/20/19.
//  Copyright © 2019 Thao Vu. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    func setUpElements(){
        //Hide error label
        errorLabel.alpha = 0;
        
        //Set up style for textboxs and buttons
        Utilities.styleTextField(textField: emailTextField)
        Utilities.styleTextField(textField: passwordTextField)
        Utilities.styleFilledButton(button: loginButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    

}
