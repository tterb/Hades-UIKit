//
//  LoginViewController.swift
//  Hades
//
//  Created by Brett Stevenson on 12/14/19.
//  Copyright © 2019 Brett Stevenson. All rights reserved.
//

import UIKit
import reddift

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
//    let reddit: RedditService
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        reddit = RedditService()
        loginButton.layer.cornerRadius = 6
        loginButton.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
        self.performSegue(withIdentifier: "loginToHome", sender: self)
//        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        do {
            try OAuth2Authorizer.sharedInstance.challengeWithAllScopes()
        } catch { }
//        let result = OAuth2TokenRepository.restoreFromKeychainWithName("Snow-o_o-")
//        switch result {
//            case .failure(let error):
//                print(error.description)
//            case .success(let token):
//                print(token)
//                con.session = Session(token: token)
//        }
    }

}

