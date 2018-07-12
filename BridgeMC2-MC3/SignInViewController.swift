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
        
        
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination  = segue.destination as? ProfileViewController else { return }
        
        destination.selectedUsername = selectedUsername
        destination.selectedEmail = selectedEmail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.value(forKey: "username") != nil, UserDefaults.standard.value(forKey: "password") != nil{
            selectedUsername = UserDefaults.standard.value(forKey: "username") as! String
            selectedPassword = UserDefaults.standard.value(forKey: "password") as! String
            
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    func <#name#>(<#parameters#>) -> <#return type#> {
        <#function body#>
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
