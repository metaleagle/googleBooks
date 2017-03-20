//
//  VolumeDetailsPresenter.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import Kingfisher

class VolumeDetailsPresenter: VolumeDetailsPresenterProtocol{
    weak var view: VolumeDetailsViewProtocol?
    var interactor: VolumeDetailsInteractorProtocol?
    var router: VolumeDetailsRouterProtocol?
    
    func setupView() {
        if let details = self.interactor?.volumeDetails{
            self.view?.setVolumeTitile(details.title)
            self.view?.setVolumeAuthors(details.authors)
            self.view?.setVolumeDescription(details.description)
            if let coverURL = details.coverImageURL{
                self.view?.coverImage.kf.setImage(with: URL(string: coverURL))
            }
        }
        else{
            let details = (self.interactor?.volumeItem)!
            self.view?.setVolumeTitile(details.title)
            self.view?.setVolumeAuthors(details.authors)
            self.view?.setVolumeDescription(nil)
            if let coverURL = details.thumbURL{
                self.view?.coverImage.kf.setImage(with: URL(string: coverURL))
            }
        }
        self.setupAddToCartButton()
    }
    
    func setupAddToCartButton(){
        if self.interactor != nil{
            self.view?.setupAddToCartButton(self.interactor!.isVolumeInCart())
        }
    }
    
    func getVolumeDetails(){
        self.interactor?.updateVolumeDetails()
    }
    
    func addToCartRequested() {
        self.interactor?.addVolumeToCart()
    }
    
    func removeFromCartRequested(){
        self.interactor?.removeVolumeFromCart()
    }
    
    func closeView() {
        self.router?.dismissVolumeDetailsInterface(from: self.view!, completion: nil)
    }
    
    func volumeDetailsUpdated(){
        self.setupView()
    }
    
    func volumeDetailsUpdateFailed(_ withMessage: String){
        print(withMessage)
    }
    
    func cartUpdateRequested(){
        self.setupAddToCartButton()
    }
}
