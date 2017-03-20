//
//  ViewController.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

class LoginView: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol?
    
    @IBOutlet var fbLoginButton: UIButton!
    @IBOutlet var gpLoginButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fbLoginButton.addTarget(self, action: #selector(fbLoginRequested(_:)), for: .touchUpInside)
        gpLoginButton.addTarget(self, action: #selector(gpLoginRequested(_:)), for: .touchUpInside)
    }

    
    @objc private func fbLoginRequested(_: UIButton){
        self.presenter?.fbLoginRequested()
    }
    
    @objc private func gpLoginRequested(_: UIButton){
        self.presenter?.gpLoginRequested()
    }

    func showLoading(_ isLoading: Bool) {
        DispatchQueue.main.async { [unowned self] in
            self.fbLoginButton.isEnabled = !isLoading
            self.gpLoginButton.isEnabled = !isLoading
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        }
    }
    
    func displayErrorWithMessage(_ message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

