//
//  FBAuthorizer.swift
//  FBLoginTest
//
//  Created by Андрей Данишевский on 13.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import FacebookLogin
import FacebookCore
class FBAuthorizer: AuthorizerProtocol{
    let interactor: LoginInteractorProtocol
    unowned let loginView: UIViewController
    
    init(withInteractor interactor: LoginInteractorProtocol, loginView: UIViewController){
        self.interactor = interactor
        self.loginView = loginView
    }
    
    func authorize() {
        let loginManager = LoginManager()
        loginManager.logIn([.email, .publicProfile], viewController: self.loginView) { (loginResult) in
            switch loginResult{
            case .success:
                self.getFBInfo()
            case .failed:
                self.interactor.authorizationFailed(withAuthorizer: self, withError: "Failed to login")
            case .cancelled:
                self.interactor.authorizationCanceled(withAuthorizer: self)
            }
        }
    }
    
    func getFBInfo(){
        let connection = GraphRequestConnection()
        let request = GraphRequest(graphPath: "/me", parameters: ["fields": "first_name, last_name, picture.type(large), email"], accessToken:AccessToken.current , httpMethod: .GET, apiVersion: .defaultVersion)
        connection.add(request) { httpResponse, result in
            switch result {
            case .success(let response):
                if let responseDictionary = response.dictionaryValue{
                    var mockDict = responseDictionary
                    mockDict.removeValue(forKey: "last_name")
                    if let userInfo = UserInfo(responseDictionary){
                        self.interactor.authorized(withAuthorizer: self, withUserInfo: userInfo)
                    }
                    else{
                        self.interactor.authorizationFailed(withAuthorizer: self, withError: "Failed to fetch user info")
                    }
                }
            case .failed(let error):
                print("Graph Request Failed: \(error)")
                self.interactor.authorizationFailed(withAuthorizer: self, withError: "Failed to fetch user info")
            }
        }
        connection.start()
    }
    
    func logout(){
        let loginManager = LoginManager()
        loginManager.logOut()
        self.interactor.loggedOut(withAuthorizer: self)
    }
    
    func isLoggedIn() -> Bool{
        return AccessToken.current != nil
    }
}

extension UserInfo {
    init?(_ withGPUserInfoDictionary: Dictionary<String, Any>){
        if let email = withGPUserInfoDictionary["email"] as? String{
            let name = withGPUserInfoDictionary["first_name"] as? String
            let lastName = withGPUserInfoDictionary["last_name"] as? String
            let picture = withGPUserInfoDictionary["picture"] as? Dictionary<String, Any>
            let data = picture?["data"] as? Dictionary<String, Any>
            let url = data?["url"] as? String
            self.init(firstName: name, lastName: lastName, email: email, userpicURL: url)
        }
        return nil
    }
}
