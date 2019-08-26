//
//  LoginViewController.swift
//  WAP2
//
//  Created by 임성현 on 28/06/2019.
//  Copyright © 2019 임성현. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var id: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func signin(_ sender: Any) {
        guard let id = id.text else { return }
        guard let password = password.text else { return }
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else {
            return
        }
        
        if findUser(name: id, password: password) {
            let signInSuccessAlert = UIAlertController(title: "SignIn", message: "로그인 성공", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                (alert) in  self.navigationController?.pushViewController(uvc, animated: true)
            })
            
            signInSuccessAlert.addAction(okAction)
            
            self.present(signInSuccessAlert, animated: true, completion: nil)
        } else {
            // Alert
            let signInFailedAlert = UIAlertController(title: "SignUp", message: "로그인 실패", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "닫기", style: .default, handler: nil)
            signInFailedAlert.addAction(cancelAction)
            self.present(signInFailedAlert, animated: true, completion: nil)
        }
    }
    
    func findUser(name: String, password: String) -> Bool {
        guard let userList: [[String:String]] = UserDefaults.standard.array(forKey: "UserList") as? [[String : String]] else {
            
            return false
        }
        UserDefaults.standard.object(forKey: "UserList")
        for userData in userList {
            let memberID: String = userData["ID"]!
            let memberPWD: String = userData["PWD"]!
            if name == memberID && password == memberPWD {
                
                return true
            }
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
