//
//  VolumeDetailsInteractor.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
class VolumeDetailsInteractor: VolumeDetailsInteractorProtocol{
    weak var presenter: VolumeDetailsPresenterProtocol?
    var volumeItem: VolumeItemUIProtocol
    var volumeDetails: VolumeDetailsUIProtocol?{
        didSet{
            self.presenter?.volumeDetailsUpdated()
        }
    }
    lazy var localDataStorage: VolumeDetailsLocalStorageProtocol = { [unowned self] in
        let storage = VolumeDetailsLocalStorage(volumeID: self.volumeItem.volumeID)
        storage.volumeUpdatedAction = { [unowned self] in
            self.presenter?.cartUpdateRequested()
        }
        return storage
    }()
    
    init(_ withVolumeItem: VolumeItemUIProtocol) {
        self.volumeItem = withVolumeItem
        
    }
    lazy var requestAPI: RequestSenderProtocol? = {
       return PathParamsRequestSender(baseURL: self.volumeItem.infoLink!, resourcePath: "", method: .GET, requestBodyString: nil)
    }()
    
    func updateVolumeDetails() {
        if self.localDataStorage.isVolumeInCart(){
            do{
                try self.volumeDetails = self.localDataStorage.getVolumeDetails()
                return
            }
            catch LocalStorageError.notFoundInLocalStorage{
                self.localDataStorage.removeVolumeFromCart()
            }
            catch{
                
            }
        }
        self.requestAPI?.sendRequest(withSuccess: { (response) in
            if let json = response.JSONBody(){
                self.volumeDetails = VolumeItemDetails(json)
            }
            
        }, errorHandler: { (errorMessage) in
            self.presenter?.volumeDetailsUpdateFailed("Failed to update volume details")
        })
    }
    
    func isVolumeInCart() -> Bool{
        return self.localDataStorage.isVolumeInCart()
    }
    
    func addVolumeToCart() {
        if !self.isVolumeInCart(){
            if let volumeToBeAdded = self.volumeDetails{
            self.localDataStorage.addVolumeToCart(volumeToBeAdded: volumeToBeAdded)
            }
        }
    }
    
    func removeVolumeFromCart() {
        if self.isVolumeInCart(){
            self.localDataStorage.removeVolumeFromCart()
        }
    }
}
