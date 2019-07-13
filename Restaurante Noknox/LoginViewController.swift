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
    
    override func viewDidAppear(_ animated: Bool) {
        self.checkStoredToken()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if (usernameTextField.validate() && passwordTextField.validate()) {
            RestApi.makeLogin(username: usernameTextField.text!, password: passwordTextField.text!, callback: { auth in
                UserDefaults.standard.set(auth?.access_token, forKey: Constants.Token)
                self.setExpireTokenDate(auth: auth!)
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

    func setExpireTokenDate(auth: Auth) {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .second, value: auth.expires_in!, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        UserDefaults.standard.set(dateFormatter.string(from: date!), forKey: Constants.Expire)
    }
    
    func checkStoredToken() {
        let token = UserDefaults.standard.string(forKey: Constants.Token)
        let expiresIn = UserDefaults.standard.string(forKey: Constants.Expire)
        
        if token != nil && expiresIn != nil  {
            let now = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            let expireDate = dateFormatter.date(from: expiresIn!)
            if now < expireDate! {
                self.goToCuisineViewController()
            }
        }
    }
}
