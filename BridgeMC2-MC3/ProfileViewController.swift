//
//  ProfileViewController.swift
//  BridgeMC2-MC3
//
//  Created by Yosua Hoo on 12/07/18.
//  Copyright © 2018 Yosua Hoo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var selectedUsername : String = ""
    var selectedEmail : String = ""
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBAction func logOutAction(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "password")
        UserDefaults.standard.removeObject(forKey: "username")
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = selectedUsername
        emailLabel.text = selectedEmail

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
