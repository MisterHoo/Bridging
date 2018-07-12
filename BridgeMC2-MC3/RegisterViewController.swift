//
//  RegisterViewController.swift
//  BridgeMC2-MC3
//
//  Created by Yosua Hoo on 12/07/18.
//  Copyright © 2018 Yosua Hoo. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBAction func signUpAction(_ sender: UIButton) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue(usernameTextField.text, forKey: "username")
        newUser.setValue(passwordTextField.text, forKey: "password")
        newUser.setValue(emailTextField.text, forKey: "email")
        
        do {
            try context.save()
            self.dismiss(animated: false)
        } catch  {
            print("error saving")
        }
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: false)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
