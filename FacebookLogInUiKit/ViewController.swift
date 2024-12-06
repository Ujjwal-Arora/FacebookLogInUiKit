//
//  ViewController.swift
//  FacebookLogInUiKit
//
//  Created by Ujjwal Arora on 06/12/24.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController, LoginButtonDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current, !token.isExpired {
            
//            let token = token.tokenString
//            let request = GraphRequest(graphPath: "me", parameters: ["fields" : "email , name"], tokenString: token, version: nil, httpMethod: .get)
//            request.start { connection, result, error in
//                print(result)
//            }
            logInFunction(token: token)
            print("Already logged out")
            
        }else{
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile", "email"]
            view.addSubview(loginButton)
        }
    }
    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: (any Error)?) {
        
//        let token = result?.token?.tokenString
//        let request = GraphRequest(graphPath: "me", parameters: ["fields" : "email , name"], tokenString: token, version: nil, httpMethod: .get)
//        request.start { connection, result, error in
//            print(result)
//        }
        logInFunction(token: result?.token)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        
    }
    func logInFunction(token : AccessToken?){
        let token = token?.tokenString
        let request = GraphRequest(graphPath: "me", parameters: ["fields" : "email , name"], tokenString: token, version: nil, httpMethod: .get)
        request.start { connection, result, error in
            print(result)
        }
    }
}
