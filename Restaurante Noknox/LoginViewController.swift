//
//  LoginViewController.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 12/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if (usernameTextField.validate() && passwordTextField.validate()) {
            RestApi.makeLogin(username: usernameTextField.text!, password: passwordTextField.text!, callback: { auth in
                UserDefaults.standard.set(auth?.access_token, forKey: Constants.Token)
                self.goToCuisineViewController()
            }, error: {})
        }
    }
    
    func goToCuisineViewController() {
        let cuisinesVC = self.storyboard?.instantiateViewController(withIdentifier: "cuisineVC") as! CuisineViewController
        self.present(cuisinesVC, animated: true, completion: nil)
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
