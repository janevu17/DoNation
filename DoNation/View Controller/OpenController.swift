//
//  OpenController.swift
//  HiWorld
//
//  Created by Thao Vu on 09/20/19.
//  Copyright © 2019 Thao Vu. All rights reserved.
//

import UIKit

class OpenController: UIViewController {
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var mottoLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(button: SignUpButton)
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

}
