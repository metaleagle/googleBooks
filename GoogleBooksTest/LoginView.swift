//
//  ViewController.swift
//  GoogleBooksTest
//
//  Created by Андрей Данишевский on 09.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

class loginView: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showLoading(_ isLoading: Bool) {
        
    }
    
    func displayErrorWithMessage(_ message: String){
        
    }

}

