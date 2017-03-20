//
//  UserProfileView.swift
//  GoogleBooksTest
//
//  Created by Andrew Danishevskyi on 20.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import UIKit
import Kingfisher
class UserProfileView: UIViewController, UserProfileViewProtocol {
    @IBOutlet private weak var userPic: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    var presenter: UserProfilePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.presenter?.viewDidLoad()
    }
    
    func setUserName(_ name: String) {
        self.userNameLabel.text = name
    }
    
    func setUserImage(with url: String) {
        self.userPic.kf.setImage(with: URL(string: url))
    }
}
