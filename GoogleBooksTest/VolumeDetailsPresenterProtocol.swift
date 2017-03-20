//
//  VolumeDetailsPresenterProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol VolumeDetailsPresenterProtocol: class {
    var view: VolumeDetailsViewProtocol? { set get }
    var interactor: VolumeDetailsInteractorProtocol? { set get }
    
    func setupView()
    func getVolumeDetails()
    func addToCartRequested()
    func removeFromCartRequested()
    func closeView()
    
    func volumeDetailsUpdated()
    func volumeDetailsUpdateFailed(_ withMessage: String)
    func cartUpdateRequested()
}
