//
//  VolumesListInteractor.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import Foundation
class VolumesListInteractor: VolumesListInteractorProtocol{
    var presenter: VolumesListPresenterProtocol?
    
    var requestAPI: PathParamsRequestSenderProtocol?
    var dataStorage: VolumesDataStorageProtocol?

    
    func volumeItem(_ forRow: Int) -> VolumeItemUIProtocol? {
        return self.dataStorage?.volumeItem(at: forRow)
    }

    func numberOfLoadedVolumes() -> Int{
        return self.dataStorage?.volumes?.count ?? 0
    }
    
    func volumesListUpdated(){
        self.presenter?.updateVolumesList()
    }
    
    func volumesListUpdateFailed() {
        
    }
}
