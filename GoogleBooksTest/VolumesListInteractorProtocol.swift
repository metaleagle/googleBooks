//
//  VolumesListInteractorProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol VolumesListInteractorProtocol{
    var presenter: VolumesListPresenterProtocol? { set get }
    var requestAPI: PathParamsRequestSenderProtocol? { get set }
    // Presenter >> Interactor
    func volumeItem(_ forRow: Int) -> VolumeItemUIProtocol?
    func numberOfLoadedVolumes() -> Int
    // Interactor << DataStorage
    func volumesListUpdated()
    func volumesListUpdateFailed()
}
