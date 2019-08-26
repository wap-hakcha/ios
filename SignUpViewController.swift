//
//  SignUpViewController.swift
//  WAP2
//
//  Created by 임성현 on 28/06/2019.
//  Copyright © 2019 임성현. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var id: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signup(_ sender: UIButton) {
        
        guard let id = id.text else { return }
        guard let password = password.text else { return }
        
        var userList: [[String: String]]
        
        if let tempList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] {
                userList = tempList
        }else {
            userList = []
        }
        
        let userData: [String:String] = ["ID":id, "PWD":password]
        
        userList.append(userData)
        UserDefaults.standard.set(userList, forKey: "UserList")
        
            
            // Alert
        let signUpSuccessAlert = UIAlertController(title: "SignUp", message: "회원가입이 완료되었습니다😉", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                (alert) in
                _ = self.navigationController?.popViewController(animated: true)
            })
            
        signUpSuccessAlert.addAction(okAction)
            
        self.present(signUpSuccessAlert, animated: true, completion: nil)
    }
}
