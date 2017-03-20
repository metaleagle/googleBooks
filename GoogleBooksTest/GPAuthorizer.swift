//
//  GPAuthorizer.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 13.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

class GPAuthorizer: NSObject, AuthorizerProtocol, GIDSignInDelegate, GIDSignInUIDelegate{
    let interactor: LoginInteractorProtocol
    unowned let loginView: UIViewController
    
    
    init(withInteractor interactor: LoginInteractorProtocol, loginView: UIViewController){
        self.interactor = interactor
        self.loginView = loginView
        super.init()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func authorize(){
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    func logout(){
        GIDSignIn.sharedInstance().signOut()
    }
    
    
    func isLoggedIn () -> Bool{
        return GIDSignIn.sharedInstance().hasAuthInKeychain()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            guard let email = user.profile.email else {
                self.interactor.authorizationFailed(withAuthorizer: self, withError: "Failed to fetch user info")
                return
            }
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            self.interactor.authorized(withAuthorizer: self, withUserInfo: UserInfo(firstName: givenName, lastName: familyName, email: email, userpicURL: user.profile.imageURL(withDimension: 200).absoluteString))
        } else {
            self.interactor.authorizationFailed(withAuthorizer: self, withError: error.localizedDescription)
        }
    }
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {

    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.loginView.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.loginView.dismiss(animated: true, completion: nil)
    }

}
