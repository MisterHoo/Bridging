//
//  SignInViewController.swift
//  BridgeMC2-MC3
//
//  Created by Yosua Hoo on 12/07/18.
//  Copyright © 2018 Yosua Hoo. All rights reserved.
//

import UIKit
import CoreData

class SignInViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var selectedUsername = ""
    var selectedEmail = ""
    var selectedPassword = ""

    @IBAction func signInAction(_ sender: UIButton) {
        signInVerification(inputedUsername: usernameTextField.text!, inputedPassword: passwordTextField.text!,fromSignIn: true)
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination  = segue.destination as? ProfileViewController else { return }
        
        destination.selectedUsername = selectedUsername
        destination.selectedEmail = selectedEmail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.value(forKey: "username") != nil, UserDefaults.standard.value(forKey: "password") != nil{
            selectedUsername = UserDefaults.standard.value(forKey: "username") as! String
            selectedPassword = UserDefaults.standard.value(forKey: "password") as! String
            signInVerification(inputedUsername: selectedUsername, inputedPassword: selectedPassword, fromSignIn: false)
            
        }
    }
    
    func signInVerification(inputedUsername : String, inputedPassword : String, fromSignIn : Bool) {
        var flag = false
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count>0{
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "username") as? String, let password = result.value(forKey: "password") as? String, let email = result.value(forKey: "email") as? String{
                        if username == inputedUsername, password == inputedPassword{
                            flag = true
                            
                            selectedEmail = email
                            selectedUsername = username
                            selectedPassword = password
                            break;
                        }
                    }
                }
            }
        } catch {
            print("gagal login")
        }
        
        if flag == true{
            if fromSignIn == true{
                print("kesave")
                UserDefaults.standard.set(selectedUsername, forKey: "username")
                UserDefaults.standard.set(selectedPassword, forKey: "password")
            }
            performSegue(withIdentifier: "SigninToProfile", sender: self)
        }else{
            let alert = UIAlertController.init(title: "Wrong Username or Password", message: "Please recheck your username or password", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: false, completion: nil)
            }))
            self.present(alert, animated: false, completion: nil)
        }
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
