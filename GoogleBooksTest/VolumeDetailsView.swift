//
//  VolumeDetailsView.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

class VolumeDetailsViewController: UIViewController, VolumeDetailsViewProtocol{
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var descriptionWebView: UIWebView!
    
    @IBAction func close(_ sender: Any) {
        self.presenter?.closeView()
    }
    var presenter: VolumeDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addToCartButton.layer.borderWidth = 1.0
        self.addToCartButton.layer.cornerRadius = 5.0
        self.setupAddToCartButton(false)
        
        self.presenter?.setupView()
        self.presenter?.getVolumeDetails()
    }
    
    func addToCartAction(_ sender: Any) {
        self.presenter?.addToCartRequested()
    }
    
    func removeFromCartAction(_ sender: Any) {
        self.presenter?.removeFromCartRequested()
    }
    
    func setVolumeTitile(_ title: String) {
         DispatchQueue.main.async {
            self.titleLabel.text = title
        }
    }
    
    func setVolumeAuthors(_ authors: [String]?) {
         DispatchQueue.main.async {
            if let authors = authors{
                self.authorsLabel.text = authors.joined(separator: ", ")
            }
            else{
                self.authorsLabel.text = ""
            }
        }
    }
    
    func setVolumeDescription(_ description: String?) {
         DispatchQueue.main.async {
            if let volumeDescription = description{
                self.descriptionWebView.isHidden = false
                self.descriptionWebView.loadHTMLString(volumeDescription, baseURL: nil)
            }
            else {
                self.descriptionWebView.isHidden = true
            }
        }
    }
    
    func setPurchaseButtonVisible(_ isVisible: Bool) {
        DispatchQueue.main.async {
            self.addToCartButton.isHidden = !isVisible
        }
    }
    
    func setupAddToCartButton(_ isItemInCart: Bool){
        self.addToCartButton.removeTarget(nil, action: nil, for: .touchUpInside)
        let color = isItemInCart ? UIColor.red : UIColor.blue
        let title = isItemInCart ? " Remove from cart " : " Add to cart "
        let action = isItemInCart ? #selector(self.removeFromCartAction(_:)) : #selector(self.addToCartAction(_:))
        self.addToCartButton.setTitleColor(color, for: .normal)
        self.addToCartButton.layer.borderColor = color.cgColor
        self.addToCartButton.setTitle(title, for: .normal)
        self.addToCartButton.addTarget(self, action: action, for: .touchUpInside)
    }
}
